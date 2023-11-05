package gitlet;

import java.io.File;
import java.util.*;
import java.text.SimpleDateFormat;

import static gitlet.Utils.*;

// TODO: any imports you need here

/** Represents a gitlet repository.
 *  TODO: It's a good idea to give a description here of what else this Class
 *  does at a high level.
 *
 *  @author TODO
 */
public class Repository {
    /**
     * TODO: add instance variables here.
     *
     * List all instance variables of the Repository class here with a useful
     * comment above them describing what that variable represents and how that
     * variable is used. We've provided two examples for you.
     */

    /** The current working directory. */
    public static final File CWD = new File(System.getProperty("user.dir"));
    /** The .gitlet directory. */
    public static final File GITLET_DIR = join(CWD, ".gitlet");
    /* The active branch */
    private static final File HEAD = new File(GITLET_DIR, "HEAD");
    private static final File ADD_INDEX = new File(GITLET_DIR, "ADD");
    private static final File REMOVE_INDEX = new File(GITLET_DIR, "REMOVE");
    /* reference directory */
    private static final File REFS_DIR = new File(GITLET_DIR, "refs");
    /* objects directory */
    private static final File OBJECTS_DIR = new File(GITLET_DIR, "objects");
    private static final File BLOB_OBJECTS_DIR = new File(OBJECTS_DIR, "blobs");
    private static final File COMMIT_OBJECTS_DIR = new File(OBJECTS_DIR, "commits");
    /* heads directory */
    private static final File HEADS_DIR = new File(REFS_DIR, "heads");

    /* some important variables */
    private static final String activating_branch = "master";

    /* these areas are stored in /index */
    private static TreeMap<String, Blob> addition_area;
    private static TreeMap<String, Blob> removal_area;

    private static Commit get_activating_commit() {
        String activating_commit_sha1 = Utils.readContentsAsString(
                Utils.join(HEADS_DIR, activating_branch));
        return Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, activating_commit_sha1), Commit.class);
    }

    private static Blob get_blob_from_area(TreeMap<String, Blob> area, String path) {
        for (Map.Entry<String, Blob> entry: area.entrySet()) {
            if (Objects.equals(entry.getValue().getPath(), path)) {
                return entry.getValue();
            }
        }
        return null;
    }

    private static Blob get_blob_from_commit(Commit commit, String SHA1) {
        TreeMap<String, Blob> blobs = commit.getBlobs();
        if (blobs != null) {
            for (Map.Entry<String, Blob> entry: blobs.entrySet()) {
                if (entry.getValue().getPath().equals(SHA1)) {
                    return entry.getValue();
                }
            }
        }
        return null;
    }

    private static String get_time() {
        // 这里的时间格式有问题
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss zzz, EEEE, d MMMM yyyy");
        return dateFormat.format(new Date());
    }

    private static Commit refreshed_commit() {
        Commit new_commit = new Commit(get_activating_commit());
        TreeMap<String, String> path_SHA1 = new_commit.getPaths();
        if (path_SHA1 == null) {
            new_commit.setBlobs(new TreeMap<>());
        }
        // 现在要建立从根目录到文件的树结构（这一步感觉非常复杂，需要努力克服）
        // 原来的想法是：先获取路径遍历的文件夹，它们是树节点的path
        // 然后根据获得的结果建树，建树应该在原来树结构的基础上建，而不应该另起炉灶
        // 但是后来把Tree这一个中间架构删掉之后，发现没有这么复杂

        // 增加内容，从addition_area中查找(只能有Blob)
        if (addition_area != null) {
            for (Map.Entry<String, Blob> entry: addition_area.entrySet()) {
                if (path_SHA1 != null) {
                    String sha1 = path_SHA1.get(entry.getValue().getSHA1());
                    if (sha1 != null) {
                        new_commit.getBlobs().remove(sha1);
                    }
                }
                new_commit.getBlobs().put(entry.getKey(), entry.getValue());
                Utils.writeObject(Utils.join(BLOB_OBJECTS_DIR, entry.getKey()), entry.getValue());
            }
        }

        // 删除内容，从removal_area中查找
        if (removal_area != null) {
            for (Map.Entry<String, Blob> entry: removal_area.entrySet()) {
                String sha1 = path_SHA1.get(entry.getValue().getPath());
                if (sha1 != null) {
                    new_commit.getBlobs().remove(sha1);
                }
            }
        }
        return new_commit;
    }

    // 定义几条规则：
    // 1、commit的索引全部都要在初始化结束之后，以初始化的对象为标准进行定义
    // 2、blob的索引要根据文件名和文件内容一起定义
    /*
     * init主要做三件事情：创建对象、引用文件夹，以及写入文件分支
     */
    public static void init() {
        try {
            boolean mkdir_DIR = GITLET_DIR.mkdirs() && REFS_DIR.mkdir() && HEADS_DIR.mkdir()
                    && OBJECTS_DIR.mkdir() && BLOB_OBJECTS_DIR.mkdir() && COMMIT_OBJECTS_DIR.mkdir();
            if (!mkdir_DIR) {
                throw new GitletException("A Gitlet version-control system already exists in the current directory.");
            }
            Commit init_commit = new Commit(null, null, null,
                    "00:00:00 UTC, Thursday, 1 January 1970", null);
            // 一个API没看到浪费了好长时间, 一个逻辑运算符弄错浪费了好长时间
            String initial_sha1 = Utils.sha1(Utils.serialize(init_commit));
            init_commit.setSHA1(initial_sha1);
            Utils.writeContents(HEAD, activating_branch);
            Utils.writeContents(Utils.join(HEADS_DIR, activating_branch), initial_sha1);
            Utils.writeObject(Utils.join(COMMIT_OBJECTS_DIR, initial_sha1), init_commit);
        } catch (GitletException ignored) {}
    }

    public static void add(String filename) {
        if (!ADD_INDEX.exists()) {
            addition_area = new TreeMap<>();
        } else {
            addition_area = Utils.readObject(ADD_INDEX, TreeMap.class);
        }
        try {
            File file = Utils.getFile(filename);
            if (file == null) {
                throw new GitletException("File does not exist.");
            }
            String res_sha1 = Utils.sha1(filename, Utils.readContents(file));
            Commit activating_commit = get_activating_commit();
            Blob blob = get_blob_from_commit(activating_commit, res_sha1);
            if (blob == null || !blob.getSHA1().equals(res_sha1)) {
                // 如果不相等，就把内容写入addition_area中
                addition_area.put(res_sha1, new Blob(res_sha1, filename, Utils.readContents(file)));
            } else {
                // 如果相等，且暂存区存在相关快照，则删除相关记录
                addition_area.remove(res_sha1);
            }
            Utils.writeObject(ADD_INDEX, addition_area);
        } catch (GitletException ignored) {}
    }

    // 我的理解，commit是一个在原来commit的基础上建树的过程
    // 建树要增加或者删除的元素，要分别从addition_area和removal_area中寻找
    // 还需要一路修改增加或者删除元素的父文件夹对应的哈希值
    public static void commit(String message) {
        try {
            if (ADD_INDEX.exists()) {
                addition_area = Utils.readObject(ADD_INDEX, TreeMap.class);
            }
            if (REMOVE_INDEX.exists()) {
                removal_area = Utils.readObject(REMOVE_INDEX, TreeMap.class);
            }
            if (addition_area == null && removal_area == null) {
                throw new GitletException("No changes added to the commit.");
            }
            if (message == null) {
                throw new GitletException("Please enter a commit message.");
            }
            Commit new_commit = refreshed_commit();
            new_commit.setMessage(message);
            new_commit.setTimestamp(get_time());
            String new_sha1 = Utils.sha1(Utils.serialize(new_commit));
            new_commit.setSHA1(new_sha1);
            Utils.writeContents(Utils.join(HEADS_DIR, activating_branch), new_sha1);
            Utils.writeObject(Utils.join(COMMIT_OBJECTS_DIR, new_sha1), new_commit);
            addition_area = null;
            removal_area = null;
        } catch (GitletException ignored) {}
    }

    public static void rm(String filename) {
        try {
            // 需要根据文件名返回Blob
            Blob addition_blob = get_blob_from_area(addition_area, filename);
            if (addition_blob != null) {
                addition_area.remove(addition_blob.getSHA1());
                return;
            }
            Commit activating_commit = get_activating_commit();
            TreeMap<String, String> path_map = activating_commit.getPaths();
            String SHA1 = path_map.get(filename);
            if (SHA1 != null) {
                removal_area.put(SHA1, activating_commit.getBlobs().get(SHA1));
                Utils.restrictedDelete(filename);
            }
            if ((addition_blob == null) && SHA1 == null) {
                throw new GitletException("No reason to remove the file.");
            }
        } catch (GitletException ignored) {}
    }

    private static void print_log(Commit commit) {
        System.out.println("===");
        System.out.println("commit " + commit.getSHA1());
        System.out.println("Date: " + commit.getTimestamp());
        System.out.println(commit.getMessage() + "\n");
        // 处理合并情况
//            if () {
//                System.out.println("Merged " + "into ");
//            }
    }

    // 这个是打印当前分支的日志消息
    public static void log() {
        Commit commit = get_activating_commit();
        while (commit != null) {
            print_log(commit);
            commit = commit.getParent();
        }
    }

    // 这个是打印所有分支的日志消息，从commit_objects中找到所有的commit
    public static void global_log() {
        List<String> files = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
        if (files != null) {
            for (String file: files) {
                Commit commit = Utils.readObject(Utils.getFile(file), Commit.class);
                print_log(commit);
            }
        }
    }

    public static void find(String message) {
        LinkedList<String> messages = new LinkedList<>();
        List<String> files = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
        try {
            if (files != null) {
                for (String file: files) {
                    Commit commit = Utils.readObject(Utils.getFile(file), Commit.class);
                    String s = commit.getMessage();
                    if (Objects.equals(s, message)) {
                        messages.add(s);
                    }
                }
            }
            if (messages.isEmpty()) {
                throw new GitletException("Found no commit with that message.");
            }
            for (String s: messages) {
                System.out.println(s);
            }
        } catch (GitletException ignored) {}
    }

    // status和checkout留到后面再写
    public static void status() {
        System.out.println("=== Branches ===");
        System.out.println("*" + activating_branch);
        List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
        if (files != null) {
            files.remove(activating_branch);
            Collections.sort(files);
            for (String file: files) {
                System.out.println(file);
            }
        }
        System.out.println("\n");
        System.out.println("=== Staged Files ===");
        if (!ADD_INDEX.exists()) {
            addition_area = new TreeMap<>();
        } else {
            addition_area = Utils.readObject(ADD_INDEX, TreeMap.class);
        }
        for (Map.Entry<String, Blob> entry: addition_area.entrySet()) {
            System.out.println(entry.getValue().getPath()); // TreeMap会自动将顺序排好
        }
        System.out.println("\n");
        System.out.println("=== Removed Files ===");
        if (!REMOVE_INDEX.exists()) {
            removal_area = new TreeMap<>();
        } else {
            removal_area = Utils.readObject(REMOVE_INDEX, TreeMap.class);
        }
        for (Map.Entry<String, Blob> entry: removal_area.entrySet()) {
            System.out.println(entry.getValue().getPath());
        }
        System.out.println("\n");
    }

    //  切换到指定分支
    public static void checkout(String branch_name) {

        return;
    }

    // 将文件切换回上次commit时的版本
    public static void checkout(File file) {

    }

    // 将文件切换回指定commit id时的版本
    public static void checkout(String commit_id, File file) {

    }

    public static void branch(String branch_name) {
        try {
            if (Objects.equals(branch_name, activating_branch)) {
                throw new GitletException("A branch with that name already exists.");
            }
            Commit commit = get_activating_commit();
            Utils.writeContents(Utils.join(HEADS_DIR, branch_name), commit.getSHA1());
        } catch (GitletException ignored) {}
    }

    public static void rm_branch(String branch_name) {
        try {
            if (Objects.equals(activating_branch, branch_name)) {
                throw new GitletException("Cannot remove the current branch.");
            }
            List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
            if (files != null && !files.contains(branch_name)) {
                throw new GitletException("A branch with that name does not exist.");
            }
        } catch (GitletException ignored) {}
    }

    // 这个reset需要注意一下，不是很好写
    public static void reset(String commit_id) {
        try {
            List<String> files = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
            if (files != null && !files.contains(commit_id)) {
                throw new GitletException("No commit with that id exists.");
            }
            // 如果存在冲突
            if (files != null && files.contains(commit_id)) {
                System.out.println("There is an untracked file in the way; delete it, or add and commit it first.");
                System.exit(1);
            }
        } catch (GitletException ignored) {}
    }

    public static void merge(String branch_name) {

    }
}

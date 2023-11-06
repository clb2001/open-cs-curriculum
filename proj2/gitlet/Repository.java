package gitlet;

import java.io.File;
import java.util.*;
import java.text.SimpleDateFormat;

import static gitlet.Utils.*;

/** Represents a gitlet repository.
 *  a bit complicating project for me
 *  does at a high level.
 *  对untracked files的理解不太好
 *  @author Libin Cheng
 */
public class Repository {
    /**
     * mainly path and macro
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
    private static final File UNTRACKED_INDEX = new File(GITLET_DIR, "UNTRACKED");
    /* reference directory */
    private static final File REFS_DIR = new File(GITLET_DIR, "refs");
    /* objects directory */
    private static final File OBJECTS_DIR = new File(GITLET_DIR, "objects");
    private static final File BLOB_OBJECTS_DIR = new File(OBJECTS_DIR, "blobs");
    private static final File COMMIT_OBJECTS_DIR = new File(OBJECTS_DIR, "commits");
    /* heads directory */
    private static final File HEADS_DIR = new File(REFS_DIR, "heads");

    /* some important variables */
    private static String activating_branch = "master";

    /* these areas are stored in /index */
    private static TreeMap<String, Blob> addition_area;
    private static TreeMap<String, Blob> removal_area;
    private static TreeMap<String, Blob> untracked_area;

//    private static TreeMap<String, Blob> get_untracked_area() {
//        // 遍历CWD文件，除掉
//    }

    private static Commit get_current_commit() {
        String activating_commit_sha1 = Utils.readContentsAsString(
                Utils.join(HEADS_DIR, activating_branch));
        Commit current_commit = Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, activating_commit_sha1),
                Commit.class);
        return current_commit;
    }

    private static Blob get_blob_from_area(TreeMap<String, Blob> area, String path) {
        for (Map.Entry<String, Blob> entry: area.entrySet()) {
            if (Objects.equals(entry.getValue().getFilename(), path)) {
                return entry.getValue();
            }
        }
        return null;
    }

    private static Blob get_blob_from_commit(Commit commit, String SHA1) {
        TreeMap<String, Blob> blobs = commit.getBlobs();
        if (blobs != null) {
            for (Map.Entry<String, Blob> entry: blobs.entrySet()) {
                if (entry.getValue().getSHA1().equals(SHA1)) {
                    return entry.getValue();
                }
            }
        }
        return null;
    }

    private static String get_time() {
        // 这里的时间格式有问题--但是改个语言差点把内核玩崩了
        Date currentTime = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "E MMM d HH:mm:ss yyyy Z", java.util.Locale.ENGLISH);
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT-8"));
        return dateFormat.format(currentTime);
    }

    private static Commit refreshed_commit() {
        Commit new_commit = new Commit(get_current_commit());
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
                    String path = entry.getValue().getFilename();
                    if (path_SHA1.containsKey(path)) {
                        new_commit.getBlobs().remove(path_SHA1.get(path));
                    }
                }
                new_commit.getBlobs().put(entry.getKey(), entry.getValue());
                Utils.writeObject(Utils.join(BLOB_OBJECTS_DIR, entry.getKey()), entry.getValue());
            }
        }

        // 删除内容，从removal_area中查找
        if (removal_area != null) {
            for (Map.Entry<String, Blob> entry: removal_area.entrySet()) {
                String sha1 = path_SHA1.get(entry.getValue().getFilename());
                if (sha1 != null) {
                    new_commit.getBlobs().remove(sha1);
                }
            }
        }
        return new_commit;
    }

    private static Commit get_commit_from_objects(String commit_id) {
        try {
            List<String> dirs = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
            if (dirs != null && !dirs.contains(commit_id)) {
                throw new GitletException("No commit with that id exists.");
            }
            return Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, commit_id), Commit.class);
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
            return null;
        } // 这么写有什么问题？
    }

    private static void process_commit(Commit current_commit, Commit target_commit) {
        // untracked如何实现？需要注意到，当前commit所包含的blob必须是准备切换的blob的超集
        TreeMap<String, String> current_paths = current_commit.getPaths();
        TreeMap<String, String> target_paths = target_commit.getPaths();
        // 第32个测试有问题
        if (target_paths != null) {
            for (Map.Entry<String, String> entry: target_paths.entrySet()) {
                // return
                if (untracked_area.containsKey(entry.getValue())) {
                    System.err.println("There is an untracked file in the way; " +
                            "delete it, or add and commit it first.");
                    System.exit(1);
                }
                Object o = target_commit.getBlobs().get(entry.getValue()).getContent();
                Utils.writeContents(Utils.join(CWD, entry.getKey()), o);
            }
        }
        if (current_paths != null) {
            for (Map.Entry<String, String> entry: current_paths.entrySet()) {
                String current_path = entry.getKey();
                if (target_paths == null || !target_paths.containsKey(current_path)) {
                    Utils.restrictedDelete(current_path);
                }
            }
        }
        addition_area = null;
        removal_area = null;
    }

    private static void awake_area() {
        if (!ADD_INDEX.exists()) {
            addition_area = new TreeMap<>();
        } else {
            addition_area = Utils.readObject(ADD_INDEX, TreeMap.class);
            if (addition_area == null) {
                addition_area = new TreeMap<>();
            }
        }
        if (!REMOVE_INDEX.exists()) {
            removal_area = new TreeMap<>();
        } else {
            removal_area = Utils.readObject(REMOVE_INDEX, TreeMap.class);
            if (removal_area == null) {
                removal_area = new TreeMap<>();
            }
        }
        if (!UNTRACKED_INDEX.exists()) {
            untracked_area = new TreeMap<>();
        } else {
            untracked_area = Utils.readObject(UNTRACKED_INDEX, TreeMap.class);
            if (untracked_area == null) {
                untracked_area = new TreeMap<>();
            }
        }
        if (!HEAD.exists()) {
            activating_branch = "master";
        } else {
            activating_branch = Utils.readContentsAsString(HEAD);
        }
    }

    private static void renew_area() {
        Utils.writeObject(ADD_INDEX, addition_area);
        Utils.writeObject(REMOVE_INDEX, removal_area);
        Utils.writeObject(UNTRACKED_INDEX ,untracked_area);
        Utils.writeContents(HEAD, activating_branch);
    }

    // 定义几条规则：
    // 1、commit的索引全部都要在初始化结束之后，以初始化的对象为标准进行定义
    // 2、blob的索引要根据文件名和文件内容一起定义
    /*
     * init主要做三件事情：创建对象、引用文件夹，以及写入文件分支
     */
    public static void init() {
        try {
            if (GITLET_DIR.exists()) {
                throw new GitletException("A Gitlet version-control system already exists in the current directory.");
            }
            boolean mkdir_DIR = GITLET_DIR.mkdirs() && REFS_DIR.mkdir() && HEADS_DIR.mkdir()
                    && OBJECTS_DIR.mkdir() && BLOB_OBJECTS_DIR.mkdir() && COMMIT_OBJECTS_DIR.mkdir();
            Commit init_commit = new Commit(null, null, "initial commit",
                    "Wed Dec 31 16:00:00 1969 -0800", null);
            // 一个API没看到浪费了好长时间, 一个逻辑运算符弄错浪费了好长时间
            String initial_sha1 = Utils.sha1(Utils.serialize(init_commit));
            init_commit.setSHA1(initial_sha1);
            Utils.writeContents(HEAD, activating_branch);
            Utils.writeObject(Utils.join(COMMIT_OBJECTS_DIR, initial_sha1), init_commit);
            Utils.writeContents(Utils.join(HEADS_DIR, activating_branch), initial_sha1);
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void add(String filename) {
        try {
            awake_area();
            File file = Utils.getFile(filename);
            if (file == null) {
                throw new GitletException("File does not exist.");
            }
            boolean need_remove = false;
            // 先删除removal_area中的相关记录
            for (Map.Entry<String, Blob> entry: removal_area.entrySet()) {
                if (Objects.equals(entry.getValue().getFilename(), filename)) {
                    removal_area.remove(entry.getKey());
                    need_remove = true;
                }
            }
            String res_sha1 = Utils.sha1(filename, Utils.readContents(file));
            Commit activating_commit = get_current_commit();
            Blob blob = get_blob_from_commit(activating_commit, res_sha1);
            if (!need_remove) {
                if (blob == null || !blob.getSHA1().equals(res_sha1)) {
                    // 如果不相等，就把内容写入addition_area中
                    addition_area.put(res_sha1, new Blob(res_sha1, filename, Utils.readContents(file)));
                } else {
                    // 如果相等，且暂存区存在相关快照，则删除相关记录
                    addition_area.remove(res_sha1);
                }
            }
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 我的理解，commit是一个在原来commit的基础上建树的过程
    // 建树要增加或者删除的元素，要分别从addition_area和removal_area中寻找
    // 还需要一路修改增加或者删除元素的父文件夹对应的哈希值
    public static void commit(String message) {
        try {
            awake_area();
            if (addition_area.isEmpty() && removal_area.isEmpty()) {
                throw new GitletException("No changes added to the commit.");
            }
            if (message == null || message.isEmpty()) {
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
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void rm(String filename) {
        try {
            awake_area();
            // 需要根据文件名返回Blob
            Blob addition_blob = get_blob_from_area(addition_area, filename);
            if (addition_blob != null) {
                addition_area.remove(addition_blob.getSHA1());
                untracked_area.put(addition_blob.getSHA1(), addition_blob);
                renew_area();
                return;
            }
            Commit activating_commit = get_current_commit();
            TreeMap<String, String> path_map = activating_commit.getPaths();
            String SHA1 = null;
            if (path_map != null) {
                SHA1 = path_map.get(filename);
            }
            if (SHA1 != null) {
                removal_area.put(SHA1, activating_commit.getBlobs().get(SHA1));
                Utils.restrictedDelete(filename);
            }
            if ((addition_blob == null) && SHA1 == null) {
                throw new GitletException("No reason to remove the file.");
            }
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
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
        Commit commit = get_current_commit();
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
                Commit commit = Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, file), Commit.class);
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
                    Commit commit = Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, file), Commit.class);
                    String s = commit.getMessage();
                    if (Objects.equals(s, message)) {
                        messages.add(commit.getSHA1());
                    }
                }
            }
            if (messages.isEmpty()) {
                throw new GitletException("Found no commit with that message.");
            }
            for (String s: messages) {
                System.out.println(s);
            }
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // status和checkout留到后面再写
    public static void status() {
        awake_area();
        System.out.println("=== Branches ===");
        System.out.println("*" + activating_branch);
        List<String> filenames = Utils.plainFilenamesIn(HEADS_DIR);
        if (filenames != null) {
            Collections.sort(filenames);
            for (String filename: filenames) {
                if (!Objects.equals(filename, activating_branch)) {
                    System.out.println(filename);
                }
            }
        }
        System.out.println("\n=== Staged Files ===");
        if (!addition_area.isEmpty()) {
            for (Map.Entry<String, Blob> entry: addition_area.entrySet()) {
                System.out.println(entry.getValue().getFilename()); // TreeMap会自动将顺序排好
            }
        }
        System.out.println("\n=== Removed Files ===");
        if (!removal_area.isEmpty()) {
            for (Map.Entry<String, Blob> entry: removal_area.entrySet()) {
                System.out.println(entry.getValue().getFilename());
            }
        }
        System.out.println("\n=== Modifications Not Staged For Commit ===");
        System.out.println("\n=== Untracked Files ===");
        if (!untracked_area.isEmpty()) {
//            for (Map.Entry<String, Blob> entry: untracked_area.entrySet()) {
//                System.out.println(entry.getValue().getFilename());
//            }
            System.out.println("${ARBLINES}");
        }
    }

    //  切换到指定分支(为什么这个功能实现得这么复杂？)
    public static void checkout_branch(String branch_name) {
        try {
            awake_area();
            if (Objects.equals(branch_name, activating_branch)) {
                throw new GitletException("No need to checkout the current branch.");
            }
            List<String> dirs = Utils.plainFilenamesIn(HEADS_DIR);
            if (dirs != null && !dirs.contains(branch_name)) {
                throw new GitletException("No such branch exists.");
            }
            Commit current_commit = get_current_commit();
            String target_commit_sha1 = Utils.readContentsAsString(Utils.join(HEADS_DIR, branch_name));
            Commit target_commit = get_commit_from_objects(target_commit_sha1);
            process_commit(current_commit, target_commit);
            activating_branch = branch_name;
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 将文件切换回上次commit时的版本
    public static void checkout_file(String filename) {
        try {
            Commit commit = get_current_commit();
            Blob blob = get_blob_from_area(commit.getBlobs(), filename);
            if (blob == null) {
                throw new GitletException("File does not exist in that commit.");
            }
            Utils.writeContents(Objects.requireNonNull(getFile(filename)), blob.getContent());
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 将文件切换回指定commit id时的版本
    public static void checkout_commit(String commit_id, String filename) {
        try {
            Commit commit = get_commit_from_objects(commit_id);
            Blob blob = get_blob_from_area(commit.getBlobs(), filename);
            if (blob == null) {
                throw new GitletException("File does not exist in that commit.");
            }
            Utils.writeContents(Objects.requireNonNull(getFile(filename)), blob.getContent());
        } catch (GitletException ignored) {}
    }

    public static void branch(String branch_name) {
        try {
            List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
            if (files == null || files.contains(branch_name)) {
                throw new GitletException("A branch with that name already exists.");
            }
            Commit commit = get_current_commit();
            Utils.writeContents(Utils.join(HEADS_DIR, branch_name), commit.getSHA1());
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void rm_branch(String branch_name) {
        try {
            awake_area();
            if (Objects.equals(activating_branch, branch_name)) {
                throw new GitletException("Cannot remove the current branch.");
            }
            List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
            if (files != null && !files.contains(branch_name)) {
                throw new GitletException("A branch with that name does not exist.");
            }
            Utils.join(HEADS_DIR, branch_name).delete();
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 这个reset需要注意一下，不是很好写
    public static void reset(String commit_id) {
        try {
            awake_area();
            Commit current_commit = get_current_commit();
            Commit target_commit = get_commit_from_objects(commit_id);
            process_commit(current_commit, target_commit);
            Utils.writeContents(Utils.join(HEADS_DIR, activating_branch), commit_id);
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    //  应该算最复杂的一个函数了
    public static void merge(String branch_name) {
        // 多叉树的最近公共祖先
    }
}

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
    /*
     * mainly path and macro
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
    private static TreeMap<String, byte[]> untracked_area;

    private static Commit get_current_commit() {
        String activating_commit_sha1 = Utils.readContentsAsString(
                Utils.join(HEADS_DIR, activating_branch));
        return Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, activating_commit_sha1),
                Commit.class);
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

    // <路径->哈希值 键值对>
    public static TreeMap<String, String> get_paths(TreeMap<String, Blob> blobs) {
        if (blobs != null) {
            TreeMap<String, String> path_map= new TreeMap<>();
            for (Map.Entry<String, Blob> entry: blobs.entrySet()) {
                path_map.put(entry.getValue().getFilename(), entry.getKey());
            }
            return path_map;
        } else {
            return null;
        }
    }

    private static String get_time() {
        // 这里的时间格式有问题--但是改个语言差点把内核玩崩了
        Date currentTime = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "E MMM d HH:mm:ss yyyy Z", java.util.Locale.ENGLISH);
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT-8"));
        return dateFormat.format(currentTime);
    }

    private static byte[] get_content_from_commit(Commit commit, String filename) {
        TreeMap<String, String> dirs = get_paths(commit.getBlobs());
        if (dirs != null && dirs.containsKey(filename)) {
            return commit.getBlobs().get(dirs.get(filename)).getContent();
        } else {
            return null;
        }
    }

    private static Commit refreshed_commit() {
        // 这里的浅拷贝坑惨我
        Commit new_commit = new Commit(get_current_commit(), true);
        TreeMap<String, String> path_SHA1 = get_paths(new_commit.getBlobs());
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
        List<String> dirs = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
        if (dirs != null && !dirs.contains(commit_id)) {
            throw new GitletException("No commit with that id exists.");
        }
        return Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, commit_id), Commit.class);
    }

    private static Commit get_split_commit(Commit current_commit, Commit branch_commit) {
        Commit current_commit_tmp = new Commit(current_commit);
        while (current_commit_tmp != null) {
            Commit branch_commit_tmp = new Commit(branch_commit);
            while (branch_commit_tmp != null) {
                if (Objects.equals(branch_commit_tmp.getSHA1(), current_commit_tmp.getSHA1())) {
                    return branch_commit_tmp;
                }
                branch_commit_tmp = branch_commit_tmp.getParent();
            }
            current_commit_tmp = current_commit_tmp.getParent();
        }
        return null;
    }

    // 任务是用target_commit取代current_commit
    // 对于文件A，分三种情况讨论：
    // 第一种情况，被target_commit跟踪，不被current_commit跟踪，这种情况直接写入
    // （写入之前记得检查文件夹中是否有untracked的文件，有的话要抛出异常--这也就很好地处理了untracked file的问题）
    // （current_commit中有内容相同的文件（即使文件名不同），则不需要抛出异常）
    // 第二种情况，被current_commit和target_commit跟踪，这种情况要比较对应的blob，以target中的为准(可以与第一种情况合并)
    // 第三种情况，被current_commit跟踪，不被target_commit跟踪，这种情况直接删除
    // 我之前的版本就非常混乱
    // 现在的版本虽然能通过测试，但是其中的逻辑还是有点混乱
    private static void process_commit(Commit current_commit, Commit target_commit) {
        TreeMap<String, String> current_paths = get_paths(current_commit.getBlobs());
        TreeMap<String, String> target_paths = get_paths(target_commit.getBlobs());
        if (untracked_area != null) {
            for (Map.Entry<String, byte[]> entry: untracked_area.entrySet()) {
                if (target_paths.containsKey(entry.getKey())){
                    throw new GitletException("There is an untracked file in the way; " +
                            "delete it, or add and commit it first.");
                }
            }
        }
        if (target_paths != null) {
            for (Map.Entry<String, String> entry: target_paths.entrySet()) {
                Blob blob = target_commit.getBlobs().get(entry.getValue());
                byte[] blob_content = blob.getContent();
                if (current_paths != null) {
                    for (Map.Entry<String, String> curr_entry: current_paths.entrySet()) {
                        byte[] curr_blob_content = current_commit.getBlobs().get(curr_entry.getValue()).getContent();
                        if (Arrays.equals(blob_content, curr_blob_content)) {
                            Utils.writeContents(Utils.join(CWD, entry.getKey()), (Object) blob_content);
                        }
                    }
                }
                Utils.writeContents(Utils.join(CWD, entry.getKey()), (Object) blob_content);
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
        if (!HEAD.exists()) {
            activating_branch = "master";
        } else {
            activating_branch = Utils.readContentsAsString(HEAD);
        }
        setUntracked_area();
    }

    private static void renew_area() {
        Utils.writeObject(ADD_INDEX, addition_area);
        Utils.writeObject(REMOVE_INDEX, removal_area);
        Utils.writeContents(HEAD, activating_branch);
        setUntracked_area();
        Utils.writeObject(UNTRACKED_INDEX, untracked_area);
    }

    private static void setUntracked_area() {
        untracked_area = new TreeMap<>();
        List<String> dirs = Utils.plainFilenamesIn(CWD);
        Commit current_commit = get_current_commit();
        TreeMap<String, String> current_paths = get_paths(current_commit.getBlobs());
        TreeMap<String, String> addition_paths = get_paths(addition_area);
        if (dirs != null) {
            for (String filename: dirs) {
                if ((current_paths == null || !current_paths.containsKey(filename)) &&
                        (addition_paths == null || !addition_paths.containsKey(filename))){
                    untracked_area.put(filename, Utils.readContents(new File(filename)));
                }
            }
        }
    }

    private static void print_log(Commit commit) {
        System.out.println("===");
        System.out.println("commit " + commit.getSHA1());
        if (commit.getMergeCommit() != null) {
            System.out.println("Merge: " + commit.getSHA1() +
                    " " + commit.getMergeCommit().getSHA1());
        }
        System.out.println("Date: " + commit.getTimestamp());
        System.out.println(commit.getMessage() + "\n");
    }

    private static void branch_check(String branch_name) {
        List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
        if (files != null && files.contains(branch_name)) {
            throw new GitletException("A branch with that name already exists.");
        }
    }

    private static boolean modified_in_commit(Commit split_commit, Commit commit,
                                              boolean split_has_file, boolean commit_has_file, String filename) {
        if (split_has_file && !commit_has_file) {
            return true;
        }
        return !Arrays.equals(get_content_from_commit(split_commit, filename),
                get_content_from_commit(commit, filename));
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
            Commit init_commit = new Commit(null, null, null, "initial commit",
                    "Wed Dec 31 16:00:00 1969 -0800", null);
            // 一个API没看到浪费了好长时间, 一个逻辑运算符弄错浪费了好长时间
            String initial_sha1 = Utils.sha1(Utils.serialize(init_commit));
            init_commit.setSHA1(initial_sha1);
            Utils.writeObject(Utils.join(COMMIT_OBJECTS_DIR, initial_sha1), init_commit);
            Utils.writeContents(Utils.join(HEADS_DIR, activating_branch), initial_sha1);
            renew_area();
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
                renew_area();
                return;
            }
            Commit activating_commit = get_current_commit();
            TreeMap<String, String> path_map = get_paths(activating_commit.getBlobs());
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

    // 这个是打印当前分支的日志消息
    public static void log() {
        awake_area();
        Commit commit = get_current_commit();
        while (commit != null) {
            print_log(commit);
            commit = commit.getParent();
        }
        renew_area();
    }

    // 这个是打印所有分支的日志消息，从commit_objects中找到所有的commit
    public static void global_log() {
        awake_area();
        List<String> files = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
        if (files != null) {
            for (String file: files) {
                Commit commit = Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, file), Commit.class);
                print_log(commit);
            }
        }
        renew_area();
    }

    public static void find(String message) {
        try {
            awake_area();
            LinkedList<String> messages = new LinkedList<>();
            List<String> files = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
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
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

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
            for (Map.Entry<String, byte[]> entry: untracked_area.entrySet()) {
                System.out.println(entry.getKey());
            }
        }
        renew_area();
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
            awake_area();
            Commit commit = get_current_commit();
            Blob blob = get_blob_from_area(commit.getBlobs(), filename);
            if (blob == null) {
                throw new GitletException("File does not exist in that commit.");
            }
            Utils.writeContents(Objects.requireNonNull(getFile(filename)), blob.getContent());
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 将文件切换回指定commit id时的版本
    public static void checkout_commit(String commit_id, String filename) {
        try {
            awake_area();
            Commit commit = get_commit_from_objects(commit_id);
            Blob blob = get_blob_from_area(commit.getBlobs(), filename);
            if (blob == null) {
                throw new GitletException("File does not exist in that commit.");
            }
            Utils.writeContents(Objects.requireNonNull(getFile(filename)), blob.getContent());
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void branch(String branch_name) {
        try {
            awake_area();
            branch_check(branch_name);
            Commit commit = get_current_commit();
            Utils.writeContents(Utils.join(HEADS_DIR, branch_name), commit.getSHA1());
            renew_area();
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
            branch_check(branch_name);
            Utils.join(HEADS_DIR, branch_name).delete();
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 这个reset需要注意一下，不是很好写（其实跟checkout_branch差不多）
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

    // Merges files from the given branch into the current branch.
    public static void merge(String branch_name) {
        try {
            awake_area();
            if (!addition_area.isEmpty() || !removal_area.isEmpty()) {
                throw new GitletException("You have uncommitted changes.");
            }
            if (Objects.equals(branch_name, activating_branch)) {
                throw new GitletException("Cannot merge a branch with itself.");
            }
            List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
            if (files == null || !files.contains(branch_name)) {
                throw new GitletException("A branch with that name does not exist.");
            }
            String branch_sha1 = readContentsAsString(join(HEADS_DIR, branch_name));
            Commit branch_commit = get_commit_from_objects(branch_sha1);
            Commit current_commit = get_current_commit();
            String current_sha1 = current_commit.getSHA1();
            while (current_commit != null) {
                String commit_sha1 = current_commit.getSHA1();
                if (Objects.equals(commit_sha1, branch_sha1)) {
                    throw new GitletException("Given branch is an ancestor of the current branch.");
                }
                current_commit = current_commit.getParent();
            }
            while (branch_commit != null) {
                String branch_commit_sha1 = branch_commit.getSHA1();
                if (Objects.equals(current_sha1, branch_commit_sha1)) {
                    checkout_branch(branch_name);
                    renew_area();
                    return;
                }
                branch_commit = branch_commit.getParent();
            }
            current_commit = get_current_commit();
            branch_commit = get_commit_from_objects(branch_sha1);
            Commit split_commit = get_split_commit(current_commit, branch_commit);
            TreeMap<String, String> current_dirs = get_paths(current_commit.getBlobs());
            TreeMap<String, String> branch_dirs = get_paths(branch_commit.getBlobs());
            TreeMap<String, String> split_dirs = get_paths(split_commit.getBlobs());
            // 首先定义一个set，获取三个commit中所有用到文件的并集
            Set<String> files_set = new TreeSet<>();
            for (Map.Entry<String, String> entry: current_dirs.entrySet()) {
                files_set.add(entry.getKey());
            }
            for (Map.Entry<String, String> entry: branch_dirs.entrySet()) {
                files_set.add(entry.getKey());
            }
            for (Map.Entry<String, String> entry: split_dirs.entrySet()) {
                files_set.add(entry.getKey());
            }
            // 得到了三个commit和一个set之后，分七种情况讨论
            for (String filename : files_set) {
                boolean split_has_file = split_dirs.containsKey(filename);
                boolean branch_has_file = branch_dirs.containsKey(filename);
                boolean current_has_file = current_dirs.containsKey(filename);
                boolean modified_in_branch = modified_in_commit(split_commit, branch_commit,
                        split_has_file, branch_has_file, filename);
                boolean modified_in_current = modified_in_commit(split_commit, current_commit,
                        split_has_file, current_has_file, filename);
                // case 1: modified in branch but not HEAD --> branch
                if (split_has_file && modified_in_branch && !modified_in_current) {
                    Utils.writeContents(Utils.join(CWD, filename),
                            (Object) get_content_from_commit(branch_commit, filename));
                    add(filename);
                }
                // case 2: modified in HEAD but not branch --> HEAD
                else if (split_has_file && !modified_in_branch && modified_in_current) {
                    Utils.writeContents(Utils.join(CWD, filename),
                            (Object) get_content_from_commit(current_commit, filename));
                    add(filename);
                }
                // case 3: modified in branch and HEAD
                //         1. in the same way --> does not matter
                //         2. in different ways --> CONFLICT
                else if (modified_in_branch && modified_in_current) {
                    byte[] branch_content = get_content_from_commit(branch_commit, filename);
                    byte[] current_content = get_content_from_commit(current_commit, filename);
                    if (!Arrays.equals(branch_content, current_content)) {
                        throw new GitletException("Encountered a merge conflict.");
                    }
                }
                // case 4: not in split nor branch but in HEAD --> HEAD
                else if (!split_has_file && !branch_has_file && current_has_file) {
                    Utils.writeContents(Utils.join(CWD, filename),
                            (Object) get_content_from_commit(current_commit, filename));
                    add(filename);
                }
                // case 5: not in split nor HEAD but in branch --> branch
                else if (!split_has_file && !current_has_file && branch_has_file) {
                    Utils.writeContents(Utils.join(CWD, filename),
                            (Object) get_content_from_commit(branch_commit, filename));
                    add(filename);
                }
                // case 6: unmodified in HEAD but not present in branch --> REMOVE
                else if (!modified_in_current && !branch_has_file) {
                    Utils.restrictedDelete(filename);
                    rm(filename);
                }
                // case 7: unmodified in branch but not present in HEAD --> REMAIN REMOVED
                else if (!modified_in_branch && !current_has_file) {
                }
            }
            String commit_message = "Merged " + branch_name + " into " + activating_branch + ".";
            current_commit.setMergeCommit(branch_commit);
            commit(commit_message);
            renew_area();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }
}

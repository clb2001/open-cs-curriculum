package gitlet;

import java.io.File;
import java.util.Objects;
import java.util.TreeMap;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    private static final File INDEX = new File(GITLET_DIR, "index");
    /* reference directory */
    private static final File REFS_DIR = new File(GITLET_DIR, "refs");
    /* objects directory */
    private static final File OBJECTS_DIR = new File(GITLET_DIR, "objects");
    /* heads directory */
    private static final File HEADS_DIR = new File(REFS_DIR, "heads");

    /* some important variables */
    private static final String activating_branch = "master";

    /* these areas are stored in /index */
    private static TreeMap<String, Blob> addition_area;
    private static TreeMap<String, Blob> removal_area;

    // TODO: how to design the structure of branch?
    private static Commit get_activating_commit() {
        String activating_commit_sha1 = Utils.readContentsAsString(
                Utils.join(HEADS_DIR, activating_branch));
        return Utils.readObject(Utils.join(OBJECTS_DIR, activating_commit_sha1), Commit.class);
    }

    private static Blob get_blob_from_area(TreeMap<String, Blob> area, String path) {
        for (Map.Entry<String, Blob> entry: area.entrySet()) {
            if (Objects.equals(entry.getValue().getPath(), path)) {
                return entry.getValue();
            }
        }
        return null;
    }

    private static Blob get_blob_from_tree(Tree tree, String SHA1) {
        if (tree == null || tree.getBlobs() == null) {
            return null;
        } else {
            for (Map.Entry<String, Blob> entry : tree.getBlobs().entrySet()) {
                if (entry.getKey().equals(SHA1)) {
                    return entry.getValue();
                }
            }
            for (Map.Entry<String, Tree> entry : tree.getTrees().entrySet()) {
                return get_blob_from_tree(entry.getValue(), SHA1);
            }
            return null;
        }
    }

    private static Blob get_blob_from_commit(Commit commit, String SHA1) {
        return get_blob_from_tree(commit.getTree(), SHA1);
    }

    private static String get_time() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss zzz, EEEE, d MMMM yyyy");
        return dateFormat.format(new Date());
    }

    private static Commit refreshed_commit() {
        Commit new_commit = new Commit(get_activating_commit());
        // 增加内容，从addition_area中查找(只能有Blob)
        for (Map.Entry<String, Blob> entry: addition_area.entrySet()) {
            Blob blob = entry.getValue();
        }
        // 删除内容，从removal_area中查找
        for (Map.Entry<String, Blob> entry: removal_area.entrySet()) {
            Blob blob = entry.getValue();
        }
        return new_commit;
    }

    // 定义几条规则：
    // 1、commit和tree的索引全部都要在初始化结束之后，以初始化的对象为标准进行定义
    // 2、blob的索引要根据文件名和文件内容一起定义
    /*
     * init主要做三件事情：创建对象、引用文件夹，以及写入文件分支
     */
    public static void init() {
        try {
            boolean mkdir_DIR = GITLET_DIR.mkdirs() && REFS_DIR.mkdir() && HEADS_DIR.mkdir() && OBJECTS_DIR.mkdir();
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
            Utils.writeObject(Utils.join(OBJECTS_DIR, initial_sha1), init_commit);
        } catch (GitletException ignored) {}
    }

    public static void add(String filename) {
        if (!INDEX.exists()) {
            addition_area = new TreeMap<>();
        } else {
            addition_area = Utils.readObject(INDEX, TreeMap.class);
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
            Utils.writeObject(INDEX, addition_area);
        } catch (GitletException ignored) {}
    }

    // 我的理解，commit是一个在原来commit的基础上建树的过程
    // 建树要增加或者删除的元素，要分别从addition_area和removal_area中寻找
    // 还需要一路修改增加或者删除元素的父文件夹对应的哈希值
    public static void commit(String message) {
        try {
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
            Utils.writeObject(Utils.join(OBJECTS_DIR, new_sha1), new_commit);
            addition_area = null;
            removal_area = null;
        } catch (GitletException ignored) {}
    }

    public static void rm(String filename) {
        try {
            // 需要根据文件名返回Blob
            Blob blob = get_blob_from_area(addition_area, filename);
            addition_area.remove(blob.getSHA1());

            File file = Utils.getFile(filename);
            if (addition_area.containsKey(filename)) {
                throw new GitletException("No reason to remove the file.");
            }
        } catch (GitletException ignored) {}
    }

    public static void log() {

    }

    public static void global_log() {

    }

    public static void find(String message) {

    }

    public static void status() {

    }

    public static void branch() {

    }

    public static void rm_branch(String branch_name) {

    }

    public static void reset(String commit_id) {

    }

    public static void merge(String branch_name) {

    }
}

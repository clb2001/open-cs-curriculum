package gitlet;

import java.io.File;
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
    private static final File HEAD_DIR = new File(CWD, "HEAD");
    /* reference directory */
    private static final File REFS_DIR = new File(GITLET_DIR, "refs");
    /* objects directory */
    private static final File OBJECTS_DIR = new File(GITLET_DIR, "objects");
    /* heads directory */
    private static final File HEADS_DIR = new File(REFS_DIR, "heads");

    /* some important variables */
    private static final String activating_branch = "master";

    // TODO: how to design the structure of branch?

    /* TODO: fill in the rest of this class. */
    /*
     * init主要做三件事情：创建对象、引用文件夹，以及写入文件分支
     */
    public static void init() {
        boolean mkdir_res = GITLET_DIR.mkdir();
        if (mkdir_res) {
            REFS_DIR.mkdir();
            HEADS_DIR.mkdir();
            OBJECTS_DIR.mkdir();
            Utils.writeContents(HEAD_DIR, "ref: " + HEADS_DIR + "/" + activating_branch);
            // TODO: initial commit
        } else {
            System.out.println("A Gitlet version-control system already exists in the current directory.");
        }
    }

    public static void add(String filename) {

    }

    public static void commit(String message) {

    }

    public static void rm(String filename) {

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

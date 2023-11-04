package gitlet;

// TODO: any imports you need here

import java.io.Serializable;
import java.util.Date; // TODO: You'll likely use this in this class

/** Represents a gitlet commit object.
 *  TODO: It's a good idea to give a description here of what else this Class
 *  does at a high level.
 *
 *  @author Libin Cheng
 */
public class Commit implements Serializable {
    /**
     * TODO: add instance variables here.
     *
     * List all instance variables of the Commit class here with a useful
     * comment above them describing what that variable represents and how that
     * variable is used. We've provided one example for `message`.
     */
    /* 将其联想为一个树状结构 */
    private Commit parent = null;
    private Tree tree = null; // 这个tree只能指向根目录
    /** The message of this Commit. */
    private String message;
    private String SHA1;
    private String timestamp = "00:00:00 UTC, Thursday, 1 January 1970";

    /* TODO: fill in the rest of this class. */
    public Commit(Commit parent, Tree tree, String message, String timestamp, String SHA1) {
        this.parent = parent;
        this.tree = tree;
        this.message = message;
        this.timestamp = timestamp;
        this.SHA1 = SHA1;
    }

    public Commit(Commit commit) {
        this.parent = commit;
        this.tree = commit.tree;
        this.message = null;
        this.timestamp = null;
        this.SHA1 = null;
    }

    public String getSHA1() {
        return SHA1;
    }

    public void setSHA1(String SHA1) {
        this.SHA1 = Utils.sha1(SHA1);
    }

    public Tree getTree() {
        return tree;
    }

    public void setTree(Tree tree) {
        this.tree = tree;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTimestamp() { return timestamp; }

    public void setTimestamp(String timestamp) { this.timestamp = timestamp; }
}

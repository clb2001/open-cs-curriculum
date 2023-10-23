package gitlet;

// TODO: any imports you need here

import java.util.Date; // TODO: You'll likely use this in this class

/** Represents a gitlet commit object.
 *  TODO: It's a good idea to give a description here of what else this Class
 *  does at a high level.
 *
 *  @author Libin Cheng
 */
public class Commit {
    /**
     * TODO: add instance variables here.
     *
     * List all instance variables of the Commit class here with a useful
     * comment above them describing what that variable represents and how that
     * variable is used. We've provided one example for `message`.
     */
    /* may be unused */
    private String author;
    /* 将其联想为一个树状结构 */
    private Commit parent = null;
    private Tree tree = null;
    /** The message of this Commit. */
    private String message;
    private String SHA1;

    /* TODO: fill in the rest of this class. */
    public String getSHA1() {
        return SHA1;
    }

    public void setSHA1(Object... vals) {
        this.SHA1 = Utils.sha1(vals);
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
}

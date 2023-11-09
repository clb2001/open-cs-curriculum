package gitlet;

import java.io.*;
import java.util.*;

/** Represents a gitlet commit object.
 *  none, thanks
 *  does at a high level.
 *
 *  @author Libin Cheng
 */
public class Commit implements Serializable {
    /**
     *
     *
     * List all instance variables of the Commit class here with a useful
     * comment above them describing what that variable represents and how that
     * variable is used. We've provided one example for `message`.
     */
    /* 将其联想为一个树状结构 */
    private Commit parent;
    /** The message of this Commit. */
    private Commit mergeCommit;
    private String message;
    private String SHA1;
    private String timestamp;
    private TreeMap<String, Blob> blobs; // String表示文件的哈希值

    public Commit(Commit parent, Commit mergeCommit, TreeMap<String, Blob> blobs, String message, String timestamp, String SHA1) {
        this.parent = parent;
        this.mergeCommit = mergeCommit;
        this.blobs = blobs;
        this.message = message;
        this.timestamp = timestamp;
        this.SHA1 = SHA1;
    }

    public Commit(Commit commit, TreeMap<String, Blob> newBlobs) {
        this.parent = commit;
        this.mergeCommit = commit.mergeCommit;
        this.blobs = newBlobs;
        this.message = commit.message;
        this.timestamp = commit.timestamp;
        this.SHA1 = commit.SHA1;
    }

    public Commit(Commit commit) {
        this.parent = commit.parent;
        this.mergeCommit = commit.mergeCommit;
        this.blobs = commit.blobs;
        this.message = commit.message;
        this.timestamp = commit.timestamp;
        this.SHA1 = commit.SHA1;
    }

    public Commit getParent() { return parent; }

    public void setParent(Commit parent) { this.parent = parent; }

    public Commit getMergeCommit() { return mergeCommit; }

    public void setMergeCommit(Commit mergeCommit) { this.mergeCommit = mergeCommit; }

    public String getSHA1() {
        return SHA1;
    }

    public void setSHA1(String SHA1) {
        // 草，我怎么会用Utils.sha1()这么愚蠢的方法？是说为什么每次返回的sha1都不一样
        this.SHA1 = SHA1;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTimestamp() { return timestamp; }

    public void setTimestamp(String timestamp) { this.timestamp = timestamp; }

    public TreeMap<String, Blob> getBlobs() { return blobs; }

    public void setBlobs(TreeMap<String, Blob> blobs) { this.blobs = blobs; }
}

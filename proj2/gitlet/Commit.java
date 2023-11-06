package gitlet;

import java.io.Serializable;
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
    private String message;
    private String SHA1;
    private String timestamp;
    private TreeMap<String, Blob> blobs; // String表示文件的哈希值

    /* TODO: fill in the rest of this class. */
    public Commit(Commit parent, TreeMap<String, Blob> blobs, String message, String timestamp, String SHA1) {
        this.parent = parent;
        this.blobs = blobs;
        this.message = message;
        this.timestamp = timestamp;
        this.SHA1 = SHA1;
    }

    public Commit(Commit commit) {
        this.parent = commit;
        this.blobs = commit.blobs;
        this.message = null;
        this.timestamp = null;
        this.SHA1 = null;
    }

    public Commit getParent() { return parent; }

    public void setParent(Commit parent) { this.parent = parent; }

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

    // <路径->哈希值 键值对>
    public TreeMap<String, String> getPaths() {
        if (blobs != null) {
            TreeMap<String, String> path_map= new TreeMap<>();
            for (Map.Entry<String, Blob> entry: blobs.entrySet()) {
                path_map.put(entry.getValue().getPath(), entry.getKey());
            }
            return path_map;
        } else {
            return null;
        }
    }
}

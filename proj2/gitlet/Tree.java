package gitlet;

import java.io.Serializable;
import java.util.TreeMap;

public class Tree implements Serializable {
    private String SHA1;
    private String path;
    private TreeMap<String, Tree> trees = null;
    private TreeMap<String, Blob> blobs = null;

    public Tree(String path, TreeMap<String, Tree> trees, TreeMap<String, Blob> blobs) {
        this.path = path;
        this.trees = trees;
        this.blobs = blobs;
    }

    public String getSHA1() {
        return SHA1;
    }

    public void setSHA1() {
        this.SHA1 = Utils.sha1();
    }

    public TreeMap<String, Tree> getTrees() {
        return trees;
    }

    public void setTrees(TreeMap<String, Tree> trees) {
        this.trees = trees;
    }

    public TreeMap<String, Blob> getBlobs() {
        return blobs;
    }

    public void setBlobs(TreeMap<String, Blob> blobs) {
        this.blobs = blobs;
    }


}

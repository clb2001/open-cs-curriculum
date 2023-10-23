package gitlet;

import java.util.TreeMap;

public class Tree {
    private String SHA1;
    private TreeMap<String, String> trees = null;
    private TreeMap<String, String> blobs = null;

    public String getSHA1() {
        return SHA1;
    }

    public void setSHA1() {
        this.SHA1 = Utils.sha1();
    }

    public TreeMap<String, String> getTrees() {
        return trees;
    }

    public void setTrees(TreeMap<String, String> trees) {
        this.trees = trees;
    }

    public TreeMap<String, String> getBlobs() {
        return blobs;
    }

    public void setBlobs(TreeMap<String, String> blobs) {
        this.blobs = blobs;
    }


}

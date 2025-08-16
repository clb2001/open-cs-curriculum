package gitlet;

//import java.io.Serializable;
import java.io.*;

// 写代码这回事吧，还是要在有个大致框架之后，赶紧写起来
// 跟做科研一样，有想法了就做，不要怕做不好，不会做，先做再说
public class Blob implements Serializable {
    private String sha1;
    private String filename;
    private byte[] content;

    public Blob(String sha1, String filename, byte[] content) {
        this.sha1 = sha1;
        this.filename = filename;
        this.content = content;
    }

    public String getSha1() {
        return sha1;
    }

    // blob的哈希值由文件名和文件内容决定
    public void setSha1(String sha1) {
        this.sha1 = sha1;
    }

    public String getFilename() {
        return filename;
    }

    public void setPath() {
        this.filename = filename;
    }

    public byte[] getContent() {
        return content;
    }

    public void setContent(byte[] content) {
        this.content = content;
    }
}

package gitlet;

import java.io.Serializable;

// 写代码这回事吧，还是要在有个大致框架之后，赶紧写起来
// 跟做科研一样，有想法了就做，不要怕做不好，不会做，先做再说
public class Blob implements Serializable {
    private String SHA1;
    private String filename;
    private Object content;

    public Blob(String SHA1, String filename, Object content) {
        this.SHA1 = SHA1;
        this.filename = filename;
        this.content = content;
    }

    public String getSHA1() {
        return SHA1;
    }

    // blob的哈希值由文件名和文件内容决定
    public void setSHA1() {
        this.SHA1 = Utils.sha1();
    }

    public String getFilename() { return filename; }

    public void setPath() { this.filename = filename; }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }
}

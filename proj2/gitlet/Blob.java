package gitlet;

// 写代码这回事吧，还是要在有个大致框架之后，赶紧写起来
// 跟做科研一样，有想法了就做，不要怕做不好，不会做，先做再说
public class Blob {
    private String SHA1;
    private Object content;

    public String getSHA1() {
        return SHA1;
    }

    public void setSHA1() {
        this.SHA1 = Utils.sha1();
    }

    public Object getContent() {
        return content;
    }

    public void setContent(Object content) {
        this.content = content;
    }
}

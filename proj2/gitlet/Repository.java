package gitlet;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.text.SimpleDateFormat;

import static gitlet.Utils.*;

/** Represents a gitlet repository.
 *  a bit complicating project for me
 *  does at a high level.
 *  对untracked files的理解不太好
 *  @author Libin Cheng
 */
public class Repository {
    /*
     * mainly path and macro
     * List all instance variables of the Repository class here with a useful
     * comment above them describing what that variable represents and how that
     * variable is used. We've provided two examples for you.
     */

    /** The current working directory. */
    public static final File CWD = new File(System.getProperty("user.dir"));
    /** The .gitlet directory. */
    public static final File GITLET_DIR = join(CWD, ".gitlet");
    /* The active branch */
    private static final File HEAD = new File(GITLET_DIR, "HEAD");
    private static final File ADD_INDEX = new File(GITLET_DIR, "ADD");
    private static final File REMOVE_INDEX = new File(GITLET_DIR, "REMOVE");
    private static final File UNTRACKED_INDEX = new File(GITLET_DIR, "UNTRACKED");
    /* reference directory */
    private static final File REFS_DIR = new File(GITLET_DIR, "refs");
    /* objects directory */
    private static final File OBJECTS_DIR = new File(GITLET_DIR, "objects");
    private static final File BLOB_OBJECTS_DIR = new File(OBJECTS_DIR, "blobs");
    private static final File COMMIT_OBJECTS_DIR = new File(OBJECTS_DIR, "commits");
    /* heads directory */
    private static final File HEADS_DIR = new File(REFS_DIR, "heads");

    /* some important variables */
    private static String activatingBranch = "master";
    private static Commit mergeCommit = null;

    /* these areas are stored in /index */
    private static TreeMap<String, Blob> additionArea;
    private static TreeMap<String, Blob> removalArea;
    private static TreeMap<String, byte[]> untrackedArea;

    // 获取当前head对应的commit
    private static Commit getCurrentCommit() {
        String activatingCommitSha1 = Utils.readContentsAsString(
                Utils.join(HEADS_DIR, activatingBranch));
        return Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, activatingCommitSha1),
                Commit.class);
    }

    // 从area中获取给定文件名对应的blob，没有返回null
    private static Blob getBlobFromArea(TreeMap<String, Blob> area, String path) {
        if (area != null) {
            for (Map.Entry<String, Blob> entry: area.entrySet()) {
                if (Objects.equals(entry.getValue().getFilename(), path)) {
                    return entry.getValue();
                }
            }
        }
        return null;
    }

    // 根据哈希值从commit中获取blob对象
    private static Blob getBlobFromCommit(Commit commit, String sha1) {
        TreeMap<String, Blob> blobs = commit.getBlobs();
        if (blobs != null) {
            for (Map.Entry<String, Blob> entry: blobs.entrySet()) {
                if (entry.getValue().getSha1().equals(sha1)) {
                    return entry.getValue();
                }
            }
        }
        return null;
    }

    // 从bolbs中获取 <路径->哈希值 键值对>
    public static TreeMap<String, String> getPaths(TreeMap<String, Blob> blobs) {
        if (blobs != null) {
            TreeMap<String, String> pathMap = new TreeMap<>();
            for (Map.Entry<String, Blob> entry: blobs.entrySet()) {
                pathMap.put(entry.getValue().getFilename(), entry.getKey());
            }
            return pathMap;
        }
        return null;
    }

    // 获取当前时间（这里的时间格式有问题--但是改个语言差点把内核玩崩了）
    private static String getTime() {
        Date currentTime = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "E MMM d HH:mm:ss yyyy Z", java.util.Locale.ENGLISH);
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT-8"));
        return dateFormat.format(currentTime);
    }

    // 从commit中获取给定文件的内容
    private static byte[] getContentFromCommit(Commit commit, String filename) {
        TreeMap<String, String> dirs = getPaths(commit.getBlobs());
        if (dirs != null && dirs.containsKey(filename)) {
            return commit.getBlobs().get(dirs.get(filename)).getContent();
        }
        return null;
    }

    // 从文件名commit_id的文件中读取Commit对象
    private static Commit getCommitFromObjects(String commitId) {
        List<String> dirs = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
        if (commitId.length() == 8) {
            if (dirs != null) {
                for (String dir: dirs) {
                    if (dir.substring(0, 8).equals(commitId)) {
                        return Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, dir), Commit.class);
                    }
                }
            }
            throw new GitletException("No commit with that id exists.");
        } else {
            if (dirs != null && !dirs.contains(commitId)) {
                throw new GitletException("No commit with that id exists.");
            }
            return Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, commitId), Commit.class);
        }
    }

    // 现在要建立从根目录到文件的树结构（这一步感觉非常复杂，需要努力克服）
    // 原来的想法是：先获取路径遍历的文件夹，它们是树节点的path
    // 然后根据获得的结果建树，建树应该在原来树结构的基础上建，而不应该另起炉灶
    // 但是后来把Tree这一个中间架构删掉之后，发现没有这么复杂
    // 更新现有的commit，这里的浅拷贝坑惨我
    private static Commit refreshedCommit(Commit commit) {
        Commit newCommit = deepCopy(commit);
        if (newCommit != null) {
            newCommit.setParent(commit);
        }
        TreeMap<String, String> pathSha1 = getPaths(newCommit.getBlobs());
        if (pathSha1 == null) {
            newCommit.setBlobs(new TreeMap<>());
        }
        // 增加内容，从addition_area中查找
        if (additionArea != null) {
            for (Map.Entry<String, Blob> entry: additionArea.entrySet()) {
                if (pathSha1 != null) {
                    String path = entry.getValue().getFilename();
                    if (pathSha1.containsKey(path)) {
                        newCommit.getBlobs().remove(pathSha1.get(path));
                    }
                }
                newCommit.getBlobs().put(entry.getKey(), entry.getValue());
                Utils.writeObject(Utils.join(BLOB_OBJECTS_DIR, entry.getKey()), entry.getValue());
            }
        }
        // 删除内容，从removal_area中查找
        if (removalArea != null) {
            for (Map.Entry<String, Blob> entry: removalArea.entrySet()) {
                if (pathSha1 != null) {
                    String sha1 = pathSha1.get(entry.getValue().getFilename());
                    if (sha1 != null) {
                        newCommit.getBlobs().remove(sha1);
                    }
                }
            }
        }
        return newCommit;
    }

    private static void getSplitCommitHelper(
            Commit commit, HashMap<String, Integer> commit_depth, int depth) {
        if (commit != null) {
            commit_depth.put(commit.getSha1(), depth);
            if (commit.getParent() != null) {
                getSplitCommitHelper(commit.getParent(), commit_depth, depth + 1);
            }
            if (commit.getMergeCommit() != null) {
                getSplitCommitHelper(commit.getMergeCommit(), commit_depth, depth + 1);
            }
        }
    }

    // 获得两个commit的最近公共节点，注意，不能按链表处理
    private static Commit getSplitCommit(Commit current_commit, Commit branch_commit) {
        HashMap<String, Integer> currentCommitDepth = new HashMap<>();
        HashMap<String, Integer> branchCommitDepth = new HashMap<>();
        getSplitCommitHelper(current_commit, currentCommitDepth, 0);
        getSplitCommitHelper(branch_commit, branchCommitDepth, 0);
        TreeMap<Integer, Commit> res = new TreeMap<>();
        for (Map.Entry<String, Integer> entry: currentCommitDepth.entrySet()) {
            if (branchCommitDepth.containsKey(entry.getKey())) {
                res.put(entry.getValue() + branchCommitDepth.get(entry.getKey()),
                        getCommitFromObjects(entry.getKey()));
            }
        }
        return res.get(res.firstKey());
    }

    // 任务是用target_commit取代current_commit
    // 对于文件A，分三种情况讨论：
    // 第一种情况，被target_commit跟踪，不被current_commit跟踪，这种情况直接写入
    // （写入之前记得检查文件夹中是否有untracked的文件，有的话要抛出异常--这也就很好地处理了untracked file的问题）
    // （current_commit中有内容相同的文件（即使文件名不同），则不需要抛出异常）
    // 第二种情况，被current_commit和target_commit跟踪，这种情况要比较对应的blob，以target中的为准(可以与第一种情况合并)
    // 第三种情况，被current_commit跟踪，不被target_commit跟踪，这种情况直接删除
    // 我之前的版本就非常混乱
    // 现在的版本虽然能通过测试，但是其中的逻辑还是有点混乱
    private static void processCommit(Commit currentCommit, Commit targetCommit) {
        TreeMap<String, String> currentPaths = getPaths(currentCommit.getBlobs());
        TreeMap<String, String> targetPaths = getPaths(targetCommit.getBlobs());
        if (untrackedArea != null) {
            for (Map.Entry<String, byte[]> entry: untrackedArea.entrySet()) {
                if (targetPaths.containsKey(entry.getKey())) {
                    throw new GitletException("There is an untracked file in the way; "
                            + "delete it, or add and commit it first.");
                }
            }
        }
        if (targetPaths != null) {
            for (Map.Entry<String, String> entry: targetPaths.entrySet()) {
                byte[] blobContent = targetCommit.getBlobs().get(entry.getValue()).getContent();
                Utils.writeContents(Utils.join(CWD, entry.getKey()), (Object) blobContent);
            }
        }
        if (currentPaths != null) {
            for (Map.Entry<String, String> entry: currentPaths.entrySet()) {
                String currentPath = entry.getKey();
                if (targetPaths == null || !targetPaths.containsKey(currentPath)) {
                    Utils.restrictedDelete(currentPath);
                }
            }
        }
        additionArea = null;
        removalArea = null;
    }

    private static void awakeArea() {
        if (!ADD_INDEX.exists()) {
            additionArea = new TreeMap<>();
        } else {
            additionArea = Utils.readObject(ADD_INDEX, TreeMap.class);
            if (additionArea == null) {
                additionArea = new TreeMap<>();
            }
        }
        if (!REMOVE_INDEX.exists()) {
            removalArea = new TreeMap<>();
        } else {
            removalArea = Utils.readObject(REMOVE_INDEX, TreeMap.class);
            if (removalArea == null) {
                removalArea = new TreeMap<>();
            }
        }
        if (!HEAD.exists()) {
            activatingBranch = "master";
        } else {
            activatingBranch = Utils.readContentsAsString(HEAD);
        }
        checkUntrackedArea();
    }

    private static void renewArea() {
        Utils.writeObject(ADD_INDEX, additionArea);
        Utils.writeObject(REMOVE_INDEX, removalArea);
        Utils.writeContents(HEAD, activatingBranch);
        checkUntrackedArea();
        Utils.writeObject(UNTRACKED_INDEX, untrackedArea);
    }

    // 只要文件夹中的文件既不是在addition_area和removal_area中，又不在commit中被跟踪，那么它就是untracked的
    private static void checkUntrackedArea() {
        untrackedArea = new TreeMap<>();
        List<String> dirs = Utils.plainFilenamesIn(CWD);
        TreeMap<String, String> currentPaths = getPaths(getCurrentCommit().getBlobs());
        TreeMap<String, String> additionPaths = getPaths(additionArea);
        if (dirs != null) {
            for (String filename: dirs) {
                if ((currentPaths == null || !currentPaths.containsKey(filename))
                        && (additionPaths == null || !additionPaths.containsKey(filename))) {
                    untrackedArea.put(filename, Utils.readContents(new File(filename)));
                }
            }
        }
    }

    private static void printLog(Commit commit) {
        System.out.println("===");
        System.out.println("commit " + commit.getSha1());
        if (commit.getMergeCommit() != null) {
            System.out.println("Merge: " + commit.getSha1().substring(0, 7)
                    + " " + commit.getMergeCommit().getSha1().substring(0, 7));
        }
        System.out.println("Date: " + commit.getTimestamp());
        System.out.println(commit.getMessage() + "\n");
    }

    private static void branchCheckExist(String branchName) {
        List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
        if (files != null && files.contains(branchName)) {
            throw new GitletException("A branch with that name already exists.");
        }
    }

    private static void branchCheckNotExist(String branchName) {
        List<String> files = Utils.plainFilenamesIn(HEADS_DIR);
        if (files == null || !files.contains(branchName)) {
            throw new GitletException("A branch with that name does not exist.");
        }
    }

    private static boolean modifiedInCommit(Commit splitCommit, Commit commit,
            boolean splitHasFile, boolean commitHasFile, String filename) {
        if (splitHasFile && !commitHasFile) {
            return true;
        }
        return !Arrays.equals(getContentFromCommit(splitCommit, filename),
                getContentFromCommit(commit, filename));
    }

    // 定义几条规则：
    // 1、commit的索引全部都要在初始化结束之后，以初始化的对象为标准进行定义
    // 2、blob的索引要根据文件名和文件内容一起定义
    /*
     * init主要做三件事情：创建对象、引用文件夹，以及写入文件分支
     */
    public static void init() {
        try {
            if (GITLET_DIR.exists()) {
                throw new GitletException("A Gitlet version-control system already exists in the current directory.");
            }
            boolean mkdirDIR = GITLET_DIR.mkdirs() && REFS_DIR.mkdir() && HEADS_DIR.mkdir()
                    && OBJECTS_DIR.mkdir() && BLOB_OBJECTS_DIR.mkdir() && COMMIT_OBJECTS_DIR.mkdir();
            Commit initCommit = new Commit(null, null, null, "initial commit",
                    "Wed Dec 31 16:00:00 1969 -0800", null);
            // 一个API没看到浪费了好长时间, 一个逻辑运算符弄错浪费了好长时间
            String initialSha1 = Utils.sha1(Utils.serialize(initCommit));
            initCommit.setSha1(initialSha1);
            Utils.writeObject(Utils.join(COMMIT_OBJECTS_DIR, initialSha1), initCommit);
            Utils.writeContents(Utils.join(HEADS_DIR, activatingBranch), initialSha1);
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void add(String filename) {
        try {
            awakeArea();
            File file = Utils.getFile(filename);
            if (file == null) {
                throw new GitletException("File does not exist.");
            }
            boolean needRemove = false;
            // 先删除removal_area中的相关记录
            for (Map.Entry<String, Blob> entry: removalArea.entrySet()) {
                if (Objects.equals(entry.getValue().getFilename(), filename)) {
                    removalArea.remove(entry.getKey());
                    needRemove = true;
                }
            }
            String resSha1 = Utils.sha1(filename, Utils.readContents(file));
            Commit activatingCommit = getCurrentCommit();
            Blob blob = getBlobFromCommit(activatingCommit, resSha1);
            if (!needRemove) {
                if (blob == null || !blob.getSha1().equals(resSha1)) {
                    // 如果不相等，就把内容写入addition_area中
                    additionArea.put(resSha1, new Blob(resSha1, filename, Utils.readContents(file)));
                } else {
                    // 如果相等，且暂存区存在相关快照，则删除相关记录
                    additionArea.remove(resSha1);
                }
            }
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 我的理解，commit是一个在原来commit的基础上建树的过程
    // 建树要增加或者删除的元素，要分别从addition_area和removal_area中寻找
    // 还需要一路修改增加或者删除元素的父文件夹对应的哈希值
    public static void commit(String message) {
        try {
            awakeArea();
            if (additionArea.isEmpty() && removalArea.isEmpty()) {
                throw new GitletException("No changes added to the commit.");
            }
            if (message == null || message.isEmpty()) {
                throw new GitletException("Please enter a commit message.");
            }
            Commit newCommit = refreshedCommit(getCurrentCommit());
            newCommit.setMergeCommit(mergeCommit);
            newCommit.setMessage(message);
            newCommit.setTimestamp(getTime());
            String newSha1 = Utils.sha1(Utils.serialize(newCommit));
            newCommit.setSha1(newSha1);
            Utils.writeContents(Utils.join(HEADS_DIR, activatingBranch), newSha1);
            Utils.writeObject(Utils.join(COMMIT_OBJECTS_DIR, newSha1), newCommit);
            additionArea = null;
            removalArea = null;
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void rm(String filename) {
        try {
            awakeArea();
            // 需要根据文件名返回Blob
            Blob additionBlob = getBlobFromArea(additionArea, filename);
            if (additionBlob != null) {
                additionArea.remove(additionBlob.getSha1());
                renewArea();
                return;
            }
            Commit activatingCommit = getCurrentCommit();
            TreeMap<String, String> pathMap = getPaths(activatingCommit.getBlobs());
            String sha1 = null;
            if (pathMap != null) {
                sha1 = pathMap.get(filename);
            }
            if (sha1 != null) {
                removalArea.put(sha1, activatingCommit.getBlobs().get(sha1));
                Utils.restrictedDelete(filename);
            }
            if ((additionBlob == null) && sha1 == null) {
                throw new GitletException("No reason to remove the file.");
            }
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 这个是打印当前分支的日志消息
    public static void log() {
        awakeArea();
        Commit commit = getCurrentCommit();
        while (commit != null) {
            printLog(commit);
            commit = commit.getParent();
        }
        renewArea();
    }

    // 这个是打印所有分支的日志消息，从commit_objects中找到所有的commit
    public static void globalLog() {
        awakeArea();
        List<String> files = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
        if (files != null) {
            for (String file: files) {
                Commit commit = Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, file), Commit.class);
                printLog(commit);
            }
        }
        renewArea();
    }

    public static void find(String message) {
        try {
            awakeArea();
            LinkedList<String> messages = new LinkedList<>();
            List<String> files = Utils.plainFilenamesIn(COMMIT_OBJECTS_DIR);
            if (files != null) {
                for (String file: files) {
                    Commit commit = Utils.readObject(Utils.join(COMMIT_OBJECTS_DIR, file), Commit.class);
                    String s = commit.getMessage();
                    if (Objects.equals(s, message)) {
                        messages.add(commit.getSha1());
                    }
                }
            }
            if (messages.isEmpty()) {
                throw new GitletException("Found no commit with that message.");
            }
            for (String s: messages) {
                System.out.println(s);
            }
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void status() {
        awakeArea();
        System.out.println("=== Branches ===");
        System.out.println("*" + activatingBranch);
        List<String> filenames = Utils.plainFilenamesIn(HEADS_DIR);
        if (filenames != null) {
            Collections.sort(filenames);
            for (String filename: filenames) {
                if (!Objects.equals(filename, activatingBranch)) {
                    System.out.println(filename);
                }
            }
        }
        System.out.println("\n=== Staged Files ===");
        if (!additionArea.isEmpty()) {
            for (Map.Entry<String, Blob> entry: additionArea.entrySet()) {
                System.out.println(entry.getValue().getFilename()); // TreeMap会自动将顺序排好
            }
        }
        System.out.println("\n=== Removed Files ===");
        if (!removalArea.isEmpty()) {
            for (Map.Entry<String, Blob> entry: removalArea.entrySet()) {
                System.out.println(entry.getValue().getFilename());
            }
        }
        System.out.println("\n=== Modifications Not Staged For Commit ===");
        System.out.println("\n=== Untracked Files ===");
        if (!untrackedArea.isEmpty()) {
            for (Map.Entry<String, byte[]> entry: untrackedArea.entrySet()) {
                System.out.println(entry.getKey());
            }
        }
        renewArea();
    }

    //  切换到指定分支(为什么这个功能实现得这么复杂？)
    public static void checkoutBranch(String branchName) {
        try {
            awakeArea();
            if (Objects.equals(branchName, activatingBranch)) {
                throw new GitletException("No need to checkout the current branch.");
            }
            List<String> dirs = Utils.plainFilenamesIn(HEADS_DIR);
            if (dirs != null && !dirs.contains(branchName)) {
                throw new GitletException("No such branch exists.");
            }
            Commit currentCommit = getCurrentCommit();
            String targetCommitSha1 = Utils.readContentsAsString(Utils.join(HEADS_DIR, branchName));
            Commit targetCommit = getCommitFromObjects(targetCommitSha1);
            processCommit(currentCommit, targetCommit);
            activatingBranch = branchName;
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 将文件切换回上次commit时的版本
    public static void checkoutFile(String filename) {
        try {
            awakeArea();
            Commit commit = getCurrentCommit();
            Blob blob = getBlobFromArea(commit.getBlobs(), filename);
            if (blob == null) {
                throw new GitletException("File does not exist in that commit.");
            }
            Utils.writeContents(Objects.requireNonNull(getFile(filename)), blob.getContent());
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 将文件切换回指定commit id时的版本
    public static void checkoutCommit(String commitId, String filename) {
        try {
            awakeArea();
            Commit commit = getCommitFromObjects(commitId);
            Blob blob = getBlobFromArea(commit.getBlobs(), filename);
            if (blob == null) {
                throw new GitletException("File does not exist in that commit.");
            }
            Utils.writeContents(Objects.requireNonNull(getFile(filename)), blob.getContent());
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void branch(String branchName) {
        try {
            awakeArea();
            branchCheckExist(branchName);
            Commit commit = getCurrentCommit();
            Utils.writeContents(Utils.join(HEADS_DIR, branchName), commit.getSha1());
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    public static void rmBranch(String branchName) {
        try {
            awakeArea();
            if (Objects.equals(activatingBranch, branchName)) {
                throw new GitletException("Cannot remove the current branch.");
            }
            branchCheckNotExist(branchName);
            Utils.join(HEADS_DIR, branchName).delete();
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // 这个reset需要注意一下，不是很好写（其实跟checkout_branch差不多）
    public static void reset(String commitId) {
        try {
            awakeArea();
            Commit currentCommit = getCurrentCommit();
            Commit targetCommit = getCommitFromObjects(commitId);
            processCommit(currentCommit, targetCommit);
            Utils.writeContents(Utils.join(HEADS_DIR, activatingBranch), commitId);
            renewArea();
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }

    // Merges files from the given branch into the current branch.
    public static void merge(String branchName) {
        try {
            awakeArea();
            if (!untrackedArea.isEmpty()) {
                throw new GitletException("There is an untracked file in the way; "
                        + "delete it, or add and commit it first.");
            }
            if (!additionArea.isEmpty() || !removalArea.isEmpty()) {
                throw new GitletException("You have uncommitted changes.");
            }
            if (Objects.equals(branchName, activatingBranch)) {
                throw new GitletException("Cannot merge a branch with itself.");
            }
            branchCheckNotExist(branchName);
            String branch_sha1 = readContentsAsString(join(HEADS_DIR, branchName));
            Commit branch_commit = getCommitFromObjects(branch_sha1);
            Commit current_commit = getCurrentCommit();
            String current_sha1 = current_commit.getSha1();
            while (current_commit != null) {
                String commit_sha1 = current_commit.getSha1();
                if (Objects.equals(commit_sha1, branch_sha1)) {
                    throw new GitletException("Given branch is an ancestor of the current branch.");
                }
                current_commit = current_commit.getParent();
            }
            while (branch_commit != null) {
                String branch_commit_sha1 = branch_commit.getSha1();
                if (Objects.equals(current_sha1, branch_commit_sha1)) {
                    System.out.println("Current branch fast-forwarded.");
                    checkoutBranch(branchName);
                    renewArea();
                    return;
                }
                branch_commit = branch_commit.getParent();
            }
            current_commit = getCurrentCommit();
            branch_commit = getCommitFromObjects(branch_sha1);
            Commit split_commit = getSplitCommit(current_commit, branch_commit);
            TreeMap<String, String> current_dirs = getPaths(current_commit.getBlobs());
            TreeMap<String, String> branch_dirs = getPaths(branch_commit.getBlobs());
            TreeMap<String, String> split_dirs = getPaths(split_commit.getBlobs());
            // 首先定义一个set，获取三个commit中所有用到文件的并集
            Set<String> files_set = new TreeSet<>();
            if (current_dirs != null) {
                for (Map.Entry<String, String> entry: current_dirs.entrySet()) {
                    files_set.add(entry.getKey());
                }
            }
            if (branch_dirs != null) {
                for (Map.Entry<String, String> entry: branch_dirs.entrySet()) {
                    files_set.add(entry.getKey());
                }
            }
            if (split_dirs != null) {
                for (Map.Entry<String, String> entry: split_dirs.entrySet()) {
                    files_set.add(entry.getKey());
                }
            }
            boolean has_exception = false;
            // 得到了三个commit和一个set之后，分七种情况讨论
            for (String filename : files_set) {
                boolean split_has_file = false;
                if (split_dirs != null) {
                    split_has_file = split_dirs.containsKey(filename);
                }
                boolean branch_has_file = false;
                if (branch_dirs != null) {
                    branch_has_file = branch_dirs.containsKey(filename);
                }
                boolean current_has_file = false;
                if (current_dirs != null) {
                    current_has_file = current_dirs.containsKey(filename);
                }
                boolean modified_in_branch = modifiedInCommit(split_commit, branch_commit,
                        split_has_file, branch_has_file, filename);
                boolean modified_in_current = modifiedInCommit(split_commit, current_commit,
                        split_has_file, current_has_file, filename);
                // case 6: unmodified in HEAD but not present in branch --> REMOVE
                if (!modified_in_current && !branch_has_file) {
                    Utils.restrictedDelete(filename);
                    rm(filename);
                }
                // case 7: unmodified in branch but not present in HEAD --> REMAIN REMOVED
                else if (!modified_in_branch && !current_has_file) {}
                // case 1: modified in branch but not HEAD --> branch
                else if (split_has_file && modified_in_branch && !modified_in_current) {
                    Object o = (Object) getContentFromCommit(branch_commit, filename);
                    if (o != null) {
                        Utils.writeContents(Utils.join(CWD, filename), o);
                        add(filename);
                    }
                }
                // case 2: modified in HEAD but not branch --> HEAD
                else if (split_has_file && !modified_in_branch && modified_in_current) {
                    Object o = (Object) getContentFromCommit(current_commit, filename);
                    if (o != null) {
                        Utils.writeContents(Utils.join(CWD, filename), o);
                        add(filename);
                    }
                }
                // case 3: modified in branch and HEAD
                //         1. in the same way --> does not matter
                //         2. in different ways --> CONFLICT
                else if (modified_in_branch && modified_in_current) {
                    byte[] branch_content = getContentFromCommit(branch_commit, filename);
                    byte[] current_content = getContentFromCommit(current_commit, filename);
                    if (!Arrays.equals(branch_content, current_content)) {
                        has_exception = true;
                        String info;
                        String current_info = null;
                        if (current_content != null) {
                            current_info = new String(current_content, StandardCharsets.UTF_8);
                        }
                        String branch_info = null;
                        if (branch_content != null) {
                            branch_info = new String(branch_content, StandardCharsets.UTF_8);
                            info = "<<<<<<< HEAD\n" + current_info +
                                    "=======\n" + branch_info + ">>>>>>>\n";
                        } else {
                            info = "<<<<<<< HEAD\n" + current_info +
                                    "=======\n>>>>>>>\n";
                        }
                        Utils.writeContents(Utils.join(CWD, filename), info);
                    }
                }
                // case 4: not in split nor branch but in HEAD --> HEAD
                else if (!split_has_file && !branch_has_file && current_has_file) {
                    Utils.writeContents(Utils.join(CWD, filename),
                            (Object) getContentFromCommit(current_commit, filename));
                    add(filename);
                }
                // case 5: not in split nor HEAD but in branch --> branch
                else if (!split_has_file && !current_has_file && branch_has_file) {
                    Utils.writeContents(Utils.join(CWD, filename),
                            (Object) getContentFromCommit(branch_commit, filename));
                    add(filename);
                }
            }
            String commit_message = "Merged " + branchName + " into " + activatingBranch + ".";
            mergeCommit = branch_commit;
            if (!additionArea.isEmpty() || !removalArea.isEmpty()) {
                commit(commit_message);
            }
            renewArea();
            if (has_exception) {
                throw new GitletException("Encountered a merge conflict.");
            }
        } catch (GitletException ignored) {
            System.err.println(ignored.getMessage());
        }
    }
}

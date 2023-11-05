package gitlet;

/** Driver class for Gitlet, a subset of the Git version-control system.
 *  @author Libin Cheng
 */

// debug: python3 tester.py --debug --verbose samples/test01-init.in
public class Main {

    /** Usage: java gitlet.Main ARGS, where ARGS contains
     *  <COMMAND> <OPERAND1> <OPERAND2> ... 
     */
    public static void main(String[] args) {
        String firstArg = args[0];
        String filename;
        String message;
        String branch_name;
        String commit_id;
        switch(firstArg) {
            case "init":
                validateNumArgs("init", args, 1);
                Repository.init();
                break;
            case "add":
                validateNumArgs("add", args, 2);
                filename = args[1];
                Repository.add(filename);
                break;
            case "commit":
                validateNumArgs("commit", args, 2);
                message = args[1];
                Repository.commit(message);
                break;
            case "rm":
                validateNumArgs("rm", args, 2);
                filename = args[1];
                Repository.rm(filename);
                break;
            case "log":
                validateNumArgs("log", args, 1);
                Repository.log();
                break;
            case "global-log":
                validateNumArgs("global-log", args, 1);
                Repository.global_log();
                break;
            case "find":
                validateNumArgs("find", args, 2);
                message = args[1];
                Repository.find(message);
                break;
            case "status":
                validateNumArgs("status", args, 1);
                Repository.status();
                break;
            case "checkout":
                if (args.length == 2) {
                    Repository.checkout(args[1]);
                } else if (args.length == 3) {
                    Repository.checkout(Utils.getFile(args[2]));
                } else if (args.length == 4) {
                    Repository.checkout(args[1], Utils.getFile(args[3]));
                } else {
                    throw new RuntimeException("Invalid number of arguments for: checkout");
                }
                break;
            case "branch":
                validateNumArgs("branch", args, 2);
                branch_name = args[1];
                Repository.branch(branch_name);
                break;
            case "rm-branch":
                validateNumArgs("rm-branch", args, 2);
                branch_name = args[1];
                Repository.rm_branch(branch_name);
                break;
            case "reset":
                // TODO: handle the 'reset' command
                validateNumArgs("reset", args, 2);
                commit_id = args[1];
                Repository.reset(commit_id);
                break;
            case "merge":
                // TODO: handle the 'merge' command:
                validateNumArgs("merge", args, 2);
                branch_name = args[1];
                Repository.merge(branch_name);
                break;
        }
    }

    public static void validateNumArgs(String cmd, String[] args, int n) {
        if (args.length != n) {
            throw new RuntimeException(
                    String.format("Invalid number of arguments for: %s.", cmd));
        }
    }
}

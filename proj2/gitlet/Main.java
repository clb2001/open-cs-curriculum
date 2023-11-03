package gitlet;

/** Driver class for Gitlet, a subset of the Git version-control system.
 *  @author Libin Cheng
 */

// debug: python3 tester.py --debug samples/test01-init.in
public class Main {

    /** Usage: java gitlet.Main ARGS, where ARGS contains
     *  <COMMAND> <OPERAND1> <OPERAND2> ... 
     */
    public static void main(String[] args) {
        // TODO: what if args is empty?
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
                // TODO: handle the `add [filename]` command
                validateNumArgs("add", args, 2);
                filename = args[1];
                Repository.add(filename);
                break;
            case "commit":
                // TODO: handle the 'commit [message]' command
                validateNumArgs("commit", args, 2);
                message = args[1];
                Repository.commit(message);
                break;
            case "rm":
                // TODO: handle the 'rm [filename]' command
                validateNumArgs("rm", args, 2);
                filename = args[1];
                Repository.rm(filename);
                break;
            case "log":
                // TODO: handle the 'log' command
                validateNumArgs("log", args, 1);
                Repository.log();
                break;
            case "global-log":
                // TODO: handle the 'global-log' command
                validateNumArgs("global-log", args, 1);
                Repository.global_log();
                break;
            case "find":
                // TODO: handle the 'commit_message' command
                validateNumArgs("find", args, 2);
                message = args[1];
                Repository.find(message);
                break;
            case "status":
                // TODO: handle the 'status' command
                validateNumArgs("status", args, 1);
                Repository.status();
                break;
            case "checkout":
                // TODO: handle the 'checkout -- filename' command

                // TODO: handle the 'checkout commit_id -- filename' command

                // TODO: handle the 'check branch-name' command

                break;
            case "branch":
                // TODO: handle the 'branch branch-name' command
                validateNumArgs("branch", args, 2);
                Repository.branch();
                break;
            case "rm-branch":
                // TODO: handle the 'rm-branch branch-name' command
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

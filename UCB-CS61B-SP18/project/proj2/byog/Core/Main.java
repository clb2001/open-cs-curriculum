package byog.Core;

import byog.TileEngine.TETile;

/**
 * @author chenglibin
 */
/* This is the main entry point for the program. This class simply parses
 *  the command line inputs, and lets the byog.Core.Game class take over
 *  in either keyboard or input string mode.
 */
public class Main {
    public static void main(String[] args) {
        if (args.length > 1) {
            System.out.println("Can only have one argument - the input string");
            System.exit(0);
        } else if (args.length == 1) {
            Game game = new Game();
            TETile[][] worldState = game.playWithInputString(args[0]);
            System.out.println(TETile.toString(worldState));
        } else {
            Game game = new Game();
            game.playWithKeyboard();
        }
    }

//    public static void main(String[] args) {
//        Game game = new Game();
//        TETile[][] worldState = game.playWithInputString("n4979154725301381123swwawd");
//        System.out.println(TETile.toString(worldState));
//
//        worldState = game.playWithInputString("n2950953422994074886sdaddawa");
//        System.out.println(TETile.toString(worldState));
//
//        worldState = game.playWithInputString("ld");
//        System.out.println(TETile.toString(worldState));
//    }
}

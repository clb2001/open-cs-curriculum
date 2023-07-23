package byog.Core;

import byog.TileEngine.TERenderer;
import byog.TileEngine.TETile;
import byog.Core.WorldMap;
import byog.Core.Util;

import java.util.ArrayList;
import java.util.Random;
import java.util.List;

//import static byog.Core.WorldMap.generateRooms;
//import static byog.Core.WorldMap.initializeWorld;

/**
 * @author chenglibin
 */
public class Game {
    TERenderer ter = new TERenderer();
    /* Feel free to change the width and height. */
    public static final int WIDTH = 80;
    public static final int HEIGHT = 30;

    /**
     * Method used for playing a fresh game. The game should start from the main menu.
     */
    public void playWithKeyboard() {
    }

    /**
     * Method used for autograding and testing the game code. The input string will be a series
     * of characters (for example, "n123sswwdasdassadwas", "n123sss:q", "lwww". The game should
     * behave exactly as if the user typed these characters into the game after playing
     * playWithKeyboard. If the string ends in ":q", the same world should be returned as if the
     * string did not end with q. For example "n123sss" and "n123sss:q" should return the same
     * world. However, the behavior is slightly different. After playing with "n123sss:q", the game
     * should save, and thus if we then called playWithInputString with the string "l", we'd expect
     * to get the exact same world back again, since this corresponds to loading the saved game.
     * @param input the input string to feed to your program
     * @return the 2D TETile[][] representing the state of the world
     */
    public TETile[][] playWithInputString(String input) {
        // Fill out this method to run the game using the input passed in,
        // and return a 2D tile representation of the world that would have been
        // drawn if the same inputs had been given to playWithKeyboard().

        TETile[][] finalWorldFrame = null;
        input = input.toLowerCase();

        char begin = input.charAt(0);
        if (begin == 'n') {
            finalWorldFrame = newGame(input);
        } else if (begin == 'l') {
            finalWorldFrame = loadGame(input);
        } else {
            System.exit(0);
        }
        return finalWorldFrame;
    }

    public TETile[][] newGame(String input) {
        // first, we should get the random seed.
        long SEED = Util.parseNumber(input);

        // second, we should initialize the map.
        TETile[][] fianlWOrldFrame = generateWorld(SEED);

        // finally, play the game ...
        return fianlWOrldFrame;
    }

    public TETile[][] loadGame(String input) {
        return null;
    }

    public TETile[][] generateWorld(long SEED) {
        TETile[][] worldMap = new TETile[WIDTH][HEIGHT];

        // step 1: initialize the world map
        initializeWorld(worldMap);
        final Random RANDOM = new Random(SEED);

        // step 2: generate the rooms
        List<Room> rooms = generateRooms(worldMap, RANDOM, 10);

        // step 3: generate the hallways
        generateHalls(worldMap, RANDOM);

        // step 4: generator the connectors
        generateConnector(worldMap, RANDOM);
        return worldMap;
    }

    private List<Room> generateRooms(TETile[][] worldMap, Random random, int roomNum) {
        Room.setRoomMaxNum(roomNum);

        List<Room> rooms = new ArrayList<>();

        for (int i = 0; i < Room.getRoomMaxNum(); i++) {
            Room newRoom;

            
        }
        return rooms;
    }

    private void generateConnector(TETile[][] worldMap, Random random) {
    }

    private void generateHalls(TETile[][] worldMap, Random random) {
    }

    private void initializeWorld(TETile[][] worldMap) {

    }


}

package byog.Core;

import byog.TileEngine.TERenderer;
import byog.TileEngine.TETile;
import byog.Core.WorldMap;
import byog.Core.Util;
import byog.Core.RandomUtils;
import byog.TileEngine.Tileset;

import java.util.ArrayList;
import java.util.Random;
import java.util.List;
import java.util.Stack;

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
        drawStartUI();
        char firstChar = getFirstChar();
        if (firstChar == 'n') {
            newGame();
        } else if (firstChar == 'l') {
            loadGame();
        } else {
            System.exit(0);
        }
    }

    public void drawStartUI() {

    }

    public char getFirstChar() {
        return 'a';
    }

    public void newGame() {

    }

    public void loadGame() {

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
        TETile[][] fianlWorldFrame = generateWorld(SEED);

        // finally, play the game ...
        return fianlWorldFrame;
    }

    public TETile[][] loadGame(String input) {
        return null;
    }

    public TETile[][] generateWorld(long SEED) {
        TETile[][] worldMap = new TETile[WIDTH][HEIGHT];

        // step 1: initialize the world map
        WorldMap.initializeWorld(worldMap);
        final Random RANDOM = new Random(SEED);

        // step 2: generate the rooms
        List<Room> rooms = WorldMap.generateRooms(worldMap, RANDOM, 10);

        // step 3: generate the hallways
        WorldMap.generateHalls(worldMap, RANDOM);

        // step 4: generator the connectors
        WorldMap.generateConnector(worldMap, RANDOM, rooms);
        return worldMap;
    }

//    private void initializeWorld(TETile[][] worldMap) {
//        for (int i = 0; i < WIDTH; i++) {
//            for (int j = 0; j < HEIGHT; j++) {
//                worldMap[i][j] = Tileset.WALL;
//            }
//        }
//
//        for (int i = 1; i < WIDTH; i += 2) {
//            for (int j = 1; j < HEIGHT; j += 2) {
//                worldMap[i][j] = Tileset.FLOOR;
//            }
//        }
//    }

//    private List<Room> generateRooms(TETile[][] worldMap, Random random, int roomNum) {
//        Room.setRoomMaxNum(roomNum);
//
//        List<Room> rooms = new ArrayList<>();
//
//        for (int i = 0; i < Room.getRoomMaxNum(); i++) {
//            Room newRoom = new Room();
//            while (!Room.isLegal(newRoom)) {
//                Position p1 = new Position(decideXOrY(random, 1, WIDTH - 3),
//                        decideXOrY(random, 1, HEIGHT - 3));
//                Position p2 = new Position(decideXOrY(random, p1.getX(), WIDTH - 1),
//                        decideXOrY(random, p1.getY(), HEIGHT - 1));
//                newRoom = new Room(p1, p2);
//            }
//            if (!newRoom.isOverlapped(rooms)) {
//                rooms.add(newRoom);
//                i++;
//                newRoom.drawRoom(worldMap, Tileset.GRASS);
//            }
//        }
//        return rooms;
//    }

//    private void generateHalls(TETile[][] worldMap, Random random) {
//        // DFS
//        Stack<Position> stack = new Stack<>();
//        Position startPoint = decideStartPoint(random, worldMap);
//        if (startPoint != null) {
//            startPoint.drawTile(worldMap, Tileset.FLOOR);
//        }
//        stack.push(startPoint);
//        while (!stack.isEmpty()) {
//            Position top = stack.peek();
//            Connector conn = nextConnector(random, top, worldMap);
//            if (conn == null) {
//                stack.pop();
//                continue;
//            }
//            conn.getGoalPos().drawTile(worldMap, Tileset.FLOOR);
//            conn.connect(worldMap, Tileset.FLOOR);
//            stack.push(conn.getGoalPos());
//        }
//    }

//    private void generateConnector(TETile[][] worldMap, Random random, List<Room> rooms) {
//        for (Room room: rooms) {
//            List<Connector> connectors = room.findConnectors(worldMap, WIDTH, HEIGHT);
//        }
//    }

//    private int decideXOrY(Random r, int start, int end) {
//        int x = RandomUtils.uniform(r, start);
//        if (x % 2 == 0) {
//            if (RandomUtils.bernoulli(r)) {
//                x++;
//            } else {
//                x--;
//            }
//        }
//        return x;
//    }
//
//    private Position decideStartPoint(Random random, TETile[][] worldMap) {
//        Position p = new Position();
//        int selector = RandomUtils.uniform(random, 0, 4);
//        switch (selector) {
//            case 0:
//                p.setX(1);
//                do {
//                    p.setX(decideXOrY(random, 1, HEIGHT - 1));
//                } while (p.isTile(worldMap, Tileset.FLOOR));
//                break;
//            case 1:
//                p.setY(1);
//                do {
//                    p.setX(decideXOrY(random, 1, WIDTH - 1));
//                } while (p.isTile(worldMap, Tileset.FLOOR));
//                break;
//            case 2:
//                p.setX(WIDTH - 2);
//                do {
//                    p.setX(decideXOrY(random, 1, HEIGHT - 1));
//                } while (p.isTile(worldMap, Tileset.FLOOR));
//                break;
//            default:
//                p.setY(HEIGHT - 2);
//                do {
//                    p.setY(decideXOrY(random, 1, WIDTH - 1));
//                } while (p.isTile(worldMap, Tileset.FLOOR));
//                break;
//        }
//        return p;
//    }
//
//    private Connector nextConnector(Random random, Position p, TETile[][] world) {
//        List<Connector> possibleConnectors = new ArrayList<>();
//        for (Direction d: Direction.values()) {
//            Connector.addConnectableDirection(possibleConnectors, world, Tileset.GRASS, d, p, WIDTH, HEIGHT);
//        }
//        if (possibleConnectors.isEmpty()) {
//            return null;
//        }
//        int selector = RandomUtils.uniform(random, 0, possibleConnectors.size());
//        return possibleConnectors.get(selector);
//    }
}

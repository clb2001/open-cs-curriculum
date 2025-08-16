package byog.Core;

import byog.TileEngine.TERenderer;
import byog.TileEngine.TETile;
import byog.TileEngine.Tileset;
import edu.princeton.cs.algs4.StdDraw;

import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Stack;

import static byog.Core.Game.HEIGHT;
import static byog.Core.Game.WIDTH;

/**
 * @author chenglibin
 */
public class WorldMap {
    public static TETile[][] generateWorld(long seed) {
        TETile[][] worldMap = new TETile[WIDTH][HEIGHT];

        // step 1: initialize the world map
        WorldMap.initializeWorld(worldMap);
        Random random = new Random(seed);

        // step 2: generate the rooms
        List<Room> rooms = WorldMap.generateRooms(worldMap, random, 10);

        // step 3: generate the hallways
        WorldMap.generateHalls(worldMap, random);

        // step 4: generator the connectors
        WorldMap.generateConnector(worldMap, random, rooms);

        // step 5: carve dead ends
        if (!rooms.isEmpty()) {
            WorldMap.carveDeadEnds(worldMap);
        }

        // step 6: carve extra walls
        WorldMap.carveExtraWalls(worldMap);

        // step 7: add door and initial player
        WorldMap.addDoorAndInitialPlayer(worldMap, random);

        return worldMap;
    }

    /*
     * @source: https://github.com/lijian12345/cs61b-sp18
     * five steps
     * step 0: initialzie the world
     */
    public static void initializeWorld(TETile[][] worldMap) {

        for (int i = 0; i < WIDTH; i++) {
            for (int j = 0; j < HEIGHT; j++) {
                worldMap[i][j] = Tileset.WALL;
            }
        }

        for (int i = 1; i < WIDTH; i += 2) {
            for (int j = 1; j < HEIGHT; j += 2) {
                worldMap[i][j] = Tileset.UNDEVFLOOR;
            }
        }
    }

    /*
     * step 1: Place a number of randomly sized and positioned rooms. If a room
     * overlaps an existing room, it is discarded. Any remaining rooms are
     * carved out.
     */
    public static List<Room> generateRooms(TETile[][] worldMap, Random random, int roomNum) {
        Room.setRoomMaxNum(roomNum);
        List<Room> rooms = new ArrayList<>();
        for (int i = 0; i < Room.getRoomMaxNum();) {
            Room newRoom;
            do {
                Position p1 = new Position(decideXOrY(random, 1, WIDTH - 3),
                        decideXOrY(random, 1, HEIGHT - 3));
                Position p2 = new Position(decideXOrY(random, p1.getX() + 1, WIDTH - 1),
                        decideXOrY(random, p1.getY() + 1, HEIGHT - 1));
                newRoom = new Room(p1, p2);
            } while (!Room.isLegal(newRoom));
            if (!newRoom.isOverlapped(rooms)) {
                rooms.add(newRoom);
                i++;
                newRoom.drawRoom(worldMap, Tileset.ROOMFLOOR);
            }
        }
        return rooms;
    }


    /*
     * step 2: Any remaining solid areas are filled in with mazes. The maze generator
     * will grow and fill in even odd-shaped areas, but will not touch any
     * rooms.
     */
    public static void generateHalls(TETile[][] worldMap, Random random) {
        // DFS
        Stack<Position> stack = new Stack<>();
        Position startPoint = decideStartPoint(random, worldMap);
        startPoint.drawTile(worldMap, Tileset.FLOOR);
        stack.push(startPoint);
        while (!stack.isEmpty()) {
            Position top = stack.peek();
            Connector conn = nextConnector(random, top, worldMap);
            if (conn == null) {
                stack.pop();
                continue;
            }
            conn.getGoalPos().drawTile(worldMap, Tileset.FLOOR);
            conn.connect(worldMap, Tileset.FLOOR);
            stack.push(conn.getGoalPos());
        }
    }

    /*
     * step 3: The result of the previous two steps is a series of unconnected rooms
     * and mazes. We walk the stage and find every tile that can be a
     * "connector". This is a solid tile that is adjacent to two unconnected
     * regions.
     */
    public static void generateConnector(TETile[][] worldMap, Random random, List<Room> rooms) {
        for (Room room: rooms) {
            List<Connector> connectors = room.findConnectors(worldMap, WIDTH, HEIGHT);
            if (connectors != null && connectors.isEmpty()) {
                continue;
            }
            int numOfSelection = RandomUtils.uniform(random, 1, 4);
            for (int i = 0; i < numOfSelection; i++) {
                if (connectors != null) {
                    int selector = RandomUtils.uniform(random, 0, connectors.size());
                    connectors.get(selector).connect(worldMap, Tileset.FLOOR);
                }
            }
        }

        for (Room room: rooms) {
            room.drawRoom(worldMap, Tileset.FLOOR);
        }
    }

    /*
     * step 4: We randomly choose connectors and open them or place a door there until
     * all of the unconnected regions have been joined. There is also a slight
     * chance to carve a connector between two already-joined regions, so that
     * the dungeon isn't single connected.
     */
    public static void carveDeadEnds(TETile[][] worldMap) {
        for (int i = 0; i < WIDTH; i++) {
            for (int j = 0; j < HEIGHT; j++) {
                Position p = new Position(i, j);
                if (p.isDeadEnd(worldMap, WIDTH, HEIGHT)) {
                    p.carveDeadEnd(worldMap, WIDTH, HEIGHT);
                }
            }
        }
    }

    public static void carveExtraWalls(TETile[][] worldMap) {
        List<Position> solidWalls = new ArrayList<>();
        for (int i = 0; i < WIDTH; i++) {
            for (int j = 0; j < HEIGHT; j++) {
                Position p = new Position(i, j);
                if (p.isSolidWall(worldMap, WIDTH, HEIGHT)) {
                    solidWalls.add(p);
                }
            }
        }

        for (Position p: solidWalls) {
            p.drawTile(worldMap, Tileset.NOTHING);
        }
    }

    /*
     * step 5: The mazes will have a lot of dead ends. Finally, we remove those by
     * repeatedly filling in any open tile that's closed on three sides. When
     * this is done, every corridor in a maze actually leads somewhere.
     */
    public static void addDoorAndInitialPlayer(TETile[][] worldMap, Random random) {
        List<Position> edges = new ArrayList<>();
        for (int i = 0; i < WIDTH; i++) {
            for (int j = 0; j < HEIGHT; j++) {
                Position p = new Position(i, j);
                if (p.isEdge(worldMap, WIDTH, HEIGHT)) {
                    edges.add(p);
                }
            }
        }
        int selector = RandomUtils.uniform(random, 0, edges.size());
        Position selected = edges.get(selector);
        selected.drawTile(worldMap, Tileset.LOCKED_DOOR);
        selected.drawInitialPerson(worldMap, WIDTH, HEIGHT);
    }

    /*
     * step 6: play the game
     */
    public static void playGame(TETile[][] worldMap, String playString) {
        for (int i = 0; i < playString.length(); i++) {
            switch (playString.charAt(i)) {
                case 'w':
                    Player.walkUp(worldMap);
                    break;
                case 'a':
                    Player.walkLeft(worldMap);
                    break;
                case 's':
                    Player.walkDown(worldMap);
                    break;
                case 'd':
                    Player.walkRight(worldMap);
                    break;
                case ':':
                    if (i + 1 < playString.length()
                            && playString.charAt(i + 1) == 'q') {
                        saveGame(worldMap);
                        return;
                    }
                    break;
                default:
            }
        }
    }

    /*
     * get && save game
     */
    public static void saveGame(TETile[][] worldMap) {
        try {
            ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("savefile.txt"));
            out.writeObject(worldMap);
            out.writeObject(Player.getPos());
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*
     * play game with keyboard
     */
    public static void playGame(TERenderer ter, TETile[][] worldMap) {
        while (true) {
            if (!StdDraw.hasNextKeyTyped()) {
                continue;
            }
            char chr = Character.toLowerCase(StdDraw.nextKeyTyped());
            switch (chr) {
                case 'w':
                    Player.walkUp(worldMap);
                    ter.renderFrame(worldMap);
                    break;
                case 'a':
                    Player.walkLeft(worldMap);
                    ter.renderFrame(worldMap);
                    break;
                case 's':
                    Player.walkDown(worldMap);
                    ter.renderFrame(worldMap);
                    break;
                case 'd':
                    Player.walkRight(worldMap);
                    ter.renderFrame(worldMap);
                    break;
                case ':':
                    while (true) {
                        if (!StdDraw.hasNextKeyTyped()) {
                            continue;
                        }
                        if (Character.toLowerCase(StdDraw.nextKeyTyped()) == 'q') {
                            saveGame(worldMap);
                            System.exit(0);
                        } else {
                            break;
                        }
                    }
                    break;
                default:
            }
        }
    }

    public static TETile[][] getSavedGame() {
        TETile[][] lastSavedWorld = null;
        try {
            ObjectInputStream in = new ObjectInputStream(new FileInputStream("savefile.txt"));
            lastSavedWorld = (TETile[][]) in.readObject();
            Player.setPos((Position) in.readObject());
            in.close();
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return lastSavedWorld;
    }

    /*
     * other methods()
     */
    private static int decideXOrY(Random r, int start, int end) {
        int x = RandomUtils.uniform(r, start, end);
        if (x % 2 == 0) {
            if (RandomUtils.bernoulli(r)) {
                x++;
            } else {
                x--;
            }
        }
        return x;
    }

    private static Position decideStartPoint(Random random, TETile[][] worldMap) {
        Position p = new Position();
        int selector = RandomUtils.uniform(random, 0, 4);
        switch (selector) {
            case 0:
                p.setX(1);
                do {
                    p.setY(decideXOrY(random, 1, HEIGHT - 1));
                } while (p.isTile(worldMap, Tileset.ROOMFLOOR));
                break;
            case 1:
                p.setY(1);
                do {
                    p.setX(decideXOrY(random, 1, WIDTH - 1));
                } while (p.isTile(worldMap, Tileset.ROOMFLOOR));
                break;
            case 2:
                p.setX(WIDTH - 2);
                do {
                    p.setY(decideXOrY(random, 1, HEIGHT - 1));
                } while (p.isTile(worldMap, Tileset.ROOMFLOOR));
                break;
            default:
                p.setY(HEIGHT - 2);
                do {
                    p.setX(decideXOrY(random, 1, WIDTH - 1));
                } while (p.isTile(worldMap, Tileset.ROOMFLOOR));
                break;
        }
        return p;
    }

    private static Connector nextConnector(Random random, Position p, TETile[][] world) {
        List<Connector> possibleConnectors = new ArrayList<>();
        for (Direction d: Direction.values()) {
            Connector.addConnectableDirection(possibleConnectors, world, Tileset.UNDEVFLOOR,
                    d, p, WIDTH, HEIGHT);
        }
        if (possibleConnectors.isEmpty()) {
            return null;
        }
        int selector = RandomUtils.uniform(random, 0, possibleConnectors.size());
        return possibleConnectors.get(selector);
    }

}

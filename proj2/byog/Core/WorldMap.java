package byog.Core;

import byog.TileEngine.TERenderer;
import byog.TileEngine.TETile;
import byog.TileEngine.Tileset;

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
                worldMap[i][j] = Tileset.FLOOR;
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

        for (int i = 0; i < Room.getRoomMaxNum(); i++) {
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
                newRoom.drawRoom(worldMap, Tileset.GRASS);
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
        if (startPoint != null) {
            startPoint.drawTile(worldMap, Tileset.FLOOR);
        }
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
        }
    }

    /*
     * step 4: We randomly choose connectors and open them or place a door there until
     * all of the unconnected regions have been joined. There is also a slight
     * chance to carve a connector between two already-joined regions, so that
     * the dungeon isn't single connected.
     */

    /*
     * step 5: The mazes will have a lot of dead ends. Finally, we remove those by
     * repeatedly filling in any open tile that's closed on three sides. When
     * this is done, every corridor in a maze actually leads somewhere.
     */

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
                    p.setX(decideXOrY(random, 1, HEIGHT - 1));
                } while (p.isTile(worldMap, Tileset.FLOOR));
                break;
            case 1:
                p.setY(1);
                do {
                    p.setX(decideXOrY(random, 1, WIDTH - 1));
                } while (p.isTile(worldMap, Tileset.FLOOR));
                break;
            case 2:
                p.setX(WIDTH - 2);
                do {
                    p.setX(decideXOrY(random, 1, HEIGHT - 1));
                } while (p.isTile(worldMap, Tileset.FLOOR));
                break;
            default:
                p.setY(HEIGHT - 2);
                do {
                    p.setY(decideXOrY(random, 1, WIDTH - 1));
                } while (p.isTile(worldMap, Tileset.FLOOR));
                break;
        }
        return p;
    }

    private static Connector nextConnector(Random random, Position p, TETile[][] world) {
        List<Connector> possibleConnectors = new ArrayList<>();
        for (Direction d: Direction.values()) {
            Connector.addConnectableDirection(possibleConnectors, world, Tileset.GRASS,
                    d, p, WIDTH, HEIGHT);
        }
        if (possibleConnectors.isEmpty()) {
            return null;
        }
        int selector = RandomUtils.uniform(random, 0, possibleConnectors.size());
        return possibleConnectors.get(selector);
    }

}

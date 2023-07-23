package byog.Core;

import byog.TileEngine.TERenderer;
import byog.TileEngine.TETile;

import java.util.List;
import java.util.Random;

/**
 * @author chenglibin
 */
public class WorldMap {

    /*
     * @source: https://github.com/lijian12345/cs61b-sp18
     * five steps
     * step 0: initialzie the world
     */
    public void initializeWorld(TETile[][] worldMap) {
        return;
    }

    /*
     * step 1: Place a number of randomly sized and positioned rooms. If a room
     * overlaps an existing room, it is discarded. Any remaining rooms are
     * carved out.
     */
    public List<Room> generateRooms(TETile[][] worldMap, Random RANDOM, int roomNum) {
        return null;
    }


    /*
     * step 2: Any remaining solid areas are filled in with mazes. The maze generator
     * will grow and fill in even odd-shaped areas, but will not touch any
     * rooms.
     */

    /*
     * step 3: The result of the previous two steps is a series of unconnected rooms
     * and mazes. We walk the stage and find every tile that can be a
     * "connector". This is a solid tile that is adjacent to two unconnected
     * regions.
     */

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
}

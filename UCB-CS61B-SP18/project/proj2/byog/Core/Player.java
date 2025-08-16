package byog.Core;

import byog.TileEngine.TETile;
import byog.TileEngine.Tileset;

/**
 * @author chenglibin
 */
public class Player {
    private static Position pos;

    public static Position getPos() {
        return pos;
    }

    public static void setPos(Position pos) {
        Player.pos = pos;
    }

    public static void walk(TETile[][] worldMap, Position newPos) {
        if (newPos.isTile(worldMap, Tileset.FLOOR)) {
            pos.drawTile(worldMap, Tileset.FLOOR);
            newPos.drawTile(worldMap, Tileset.PLAYER);
            pos = newPos;
        }
    }

    public static void walkLeft(TETile[][] worldMap) {
        Position newPos = new Position(pos.getX() - 1, pos.getY());
        walk(worldMap, newPos);
    }

    public static void walkRight(TETile[][] worldMap) {
        Position newPos = new Position(pos.getX() + 1, pos.getY());
        walk(worldMap, newPos);
    }

    public static void walkUp(TETile[][] worldMap) {
        Position newPos = new Position(pos.getX(), pos.getY() + 1);
        walk(worldMap, newPos);
    }

    public static void walkDown(TETile[][] worldMap) {
        Position newPos = new Position(pos.getX(), pos.getY() - 1);
        walk(worldMap, newPos);
    }
}

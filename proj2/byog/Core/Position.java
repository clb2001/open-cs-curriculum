package byog.Core;

import byog.TileEngine.TETile;
import byog.TileEngine.Tileset;

import javax.swing.plaf.PanelUI;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author chenglibin
 * the class of position
 */
public class Position implements Serializable {
    private int x;
    private int y;

    public Position() {

    }

    public Position(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void setX(int x) {
        this.x = x;
    }

    public void setY(int y) {
        this.y = y;
    }

    // the edge of room and hallway
    public boolean isEdge(TETile[][] world, int width, int height) {
        if (!isTile(world, Tileset.WALL)) {
            return false;
        }
        int num = 0;
        Position pos = new Position();

        // get the floor(maybe one, maybe zero)
        for (Position p: getAroundPosition(width, height, false)) {
            if (p.isTile(world, Tileset.FLOOR)) {
                num++;
                pos = p;
            }
        }

        // what's the meaning of width and height?
        if (num == 1) {
            switch (getDirection(pos, width, height)) {
                case LEFT:
                    for (int i = x + 1; i < width; i++) {
                        Position p = new Position(i, y);
                        if (!p.isTile(world, Tileset.NOTHING)) {
                            return false;
                        }
                    }
                case RIGHT:
                    for (int i = x - 1; i >= 0; i--) {
                        Position p = new Position(i, y);
                        if (!p.isTile(world, Tileset.NOTHING)) {
                            return false;
                        }
                    }
                case DOWN:
                    for (int i = y + 1; i < height; i++) {
                        Position p = new Position(x, i);
                        if (!p.isTile(world, Tileset.NOTHING)) {
                            return false;
                        }
                    }
                default:
                    for (int i = y - 1; i >= 0; i--) {
                        Position p = new Position(x, i);
                        if (!p.isTile(world, Tileset.NOTHING)) {
                            return false;
                        }
                    }
            }
        }
        return false;
    }

    public boolean isTile(TETile[][] world, TETile t) {
        return world[x][y] == t;
    }

    private List<Position> getAroundPosition(int width, int height, boolean isAll) {
        List<Position> res = new ArrayList<>();
        if (x + 1 < width) {
            res.add(new Position(x + 1, y));
        }
        if (x - 1 >= 0) {
            res.add(new Position(x - 1, y));
        }
        if (y + 1 < height) {
            res.add(new Position(x, y + 1));
        }
        if (y - 1 >= 0) {
            res.add(new Position(x, y - 1));
        }
        if (isAll) {
            if (x + 1 < width && y + 1 < height) {
                res.add(new Position(x + 1, y + 1));
            }
            if (x + 1 < width && y - 1 >= 0) {
                res.add(new Position(x + 1, y - 1));
            }
            if (x - 1 >= 0 && y + 1 < height) {
                res.add(new Position(x - 1, y + 1));
            }
            if (x - 1 >= 0 && y - 1 >= 0) {
                res.add(new Position(x - 1, y + 1));
            }
        }
        return res;
    }

    public Direction getDirection(Position A, int width, int height) {
        if (A.x > x) {
            return Direction.RIGHT;
        } else if (A.x < x) {
            return Direction.LEFT;
        } else if (A.y > y) {
            return Direction.UP;
        } else {
            return Direction.DOWN;
        }
    }

    public void drawTile(TETile[][] world, TETile t) {
        world[x][y] = t;
    }
}

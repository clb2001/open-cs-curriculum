package byog.Core;

import byog.TileEngine.TETile;

import java.util.ArrayList;
import java.util.List;

public class Room {
    private Position bottomLeft;
    private Position upRight;
    private static int roomMaxNum = 20;
    private static int roomMaxWidth = 8;
    private static int roomMaxHeight = 6;

    public Room() {}

    public Room(Position bottomLeft, Position upRight) {
        this.bottomLeft = bottomLeft;
        this.upRight = upRight;
    }

    public int getWidth() {
        return upRight.getX() - bottomLeft.getX();
    }

    public int getHeight() {
        return upRight.getY() - bottomLeft.getY();
    }

    public Position getCentralPos() {
        return new Position((upRight.getX() + bottomLeft.getX()) / 2, (upRight.getY() + bottomLeft.getY()) / 2);
    }

    public static void setRoomMaxNum(int roomMaxNum) {
        Room.roomMaxNum = roomMaxNum;
    }

    public static int getRoomMaxNum() {
        return Room.roomMaxNum;
    }

    public static boolean isLegal(Room r) {
        boolean isXLegal = (r.bottomLeft.getX() != r.bottomLeft.getX());
        boolean isYLegal = (r.bottomLeft.getY() != r.bottomLeft.getY());
        boolean isWidthLegal = (r.getWidth() < Room.roomMaxWidth);
        boolean isHeightLegal = (r.getHeight() < Room.roomMaxHeight);
        return isXLegal && isYLegal && isWidthLegal && isHeightLegal;
    }

    public boolean isOverlapped(Room r) {
        Position object1 = getCentralPos();
        Position object2 = r.getCentralPos();
        int absX = Math.abs(object2.getX() - object1.getX());
        int absY = Math.abs(object2.getY() - object1.getY());
        boolean XOver = (absX <= (getWidth() + r.getWidth()) / 2);
        boolean YOver = (absY <= (getHeight() + r.getHeight()) / 2);
        return XOver && YOver;
    }

    public boolean isOverlapped(List<Room> rooms) {
        for (Room room : rooms) {
            if (this.isOverlapped(room)) {
                return true;
            }
        }
        return false;
    }

    public void drawRoom(TETile[][] world, TETile t) {
        for (int i = bottomLeft.getX(); i <= upRight.getX(); i++) {
            for (int j = bottomLeft.getY(); j < upRight.getY(); j++) {
                world[i][j] = t;
            }
        }
    }

    public List<Connector> findConnectors(TETile[][] world, int width, int height) {
        List<Connector> res = new ArrayList<>();
        for (int i = bottomLeft.getX(); i <= upRight.getX(); i++) {
            
        }
    }
}

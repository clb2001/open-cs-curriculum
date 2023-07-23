package byog.Core;

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
}

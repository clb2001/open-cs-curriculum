package byog.Core;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @author chenglibin
 */
public class RandomDungeonGenerator {
    private static final int WIDTH = 40;
    private static final int HEIGHT = 20;
    private static final int NUM_ROOMS = 8;

    private static final char WALL = '#';
    private static final char ROOM = 'R';
    private static final char CORRIDOR = '.';

    private static char[][] dungeon = new char[HEIGHT][WIDTH];
    private static Random random = new Random();
    private static List<Rect> _rooms = new ArrayList<>();

    public static void main(String[] args) {
        generateDungeon();
        printDungeon();
    }

    private static void generateDungeon() {
        // Initialize the dungeon with walls
        for (int y = 0; y < HEIGHT; y++) {
            for (int x = 0; x < WIDTH; x++) {
                dungeon[y][x] = WALL;
            }
        }

        // Generate rooms
        for (int i = 0; i < NUM_ROOMS; i++) {
            int roomWidth = random.nextInt(6) + 4; // Random width between 4 and 9
            int roomHeight = random.nextInt(6) + 4; // Random height between 4 and 9
            int x = random.nextInt(WIDTH - roomWidth - 1) + 1;
            int y = random.nextInt(HEIGHT - roomHeight - 1) + 1;

            // Check if the room overlaps with existing rooms
            boolean overlaps = false;
            for (Rect room : _rooms) {
                if (room.intersects(x, y, roomWidth, roomHeight)) {
                    overlaps = true;
                    break;
                }
            }

            if (!overlaps) {
                // Add the room to the dungeon
                for (int cy = y; cy < y + roomHeight; cy++) {
                    for (int cx = x; cx < x + roomWidth; cx++) {
                        dungeon[cy][cx] = ROOM;
                    }
                }

                // Add the room's bounding rectangle to the list of rooms
                _rooms.add(new Rect(x, y, roomWidth, roomHeight));
            }
        }

        // Generate corridors to connect the rooms
        for (int i = 0; i < _rooms.size() - 1; i++) {
            Rect currentRoom = _rooms.get(i);
            Rect nextRoom = _rooms.get(i + 1);

            int startX = currentRoom.centerX();
            int startY = currentRoom.centerY();
            int endX = nextRoom.centerX();
            int endY = nextRoom.centerY();

            while (startX != endX || startY != endY) {
                if (startX != endX && random.nextBoolean()) {
                    startX += (startX < endX) ? 1 : -1;
                } else if (startY != endY) {
                    startY += (startY < endY) ? 1 : -1;
                }
                dungeon[startY][startX] = CORRIDOR;
            }
        }
    }

    private static void printDungeon() {
        for (int y = 0; y < HEIGHT; y++) {
            for (int x = 0; x < WIDTH; x++) {
                System.out.print(dungeon[y][x] + " ");
            }
            System.out.println();
        }
    }

    private static class Rect {
        int x;
        int y;
        int width;
        int height;

        Rect(int x, int y, int width, int height) {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
        }

        boolean intersects(int otherX, int otherY, int otherWidth, int otherHeight) {
            return (x < otherX + otherWidth &&
                    x + width > otherX &&
                    y < otherY + otherHeight &&
                    y + height > otherY);
        }

        int centerX() {
            return x + width / 2;
        }

        int centerY() {
            return y + height / 2;
        }
    }
}

package byog.Core;

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
}

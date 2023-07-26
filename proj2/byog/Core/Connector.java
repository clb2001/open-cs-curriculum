package byog.Core;

import byog.TileEngine.TETile;

import java.util.List;

/**
 * @author chenglibin
 */
public class Connector {
    private Position goalPos;
    private Direction direction;

    public Connector(Position goalPos, Direction direction) {
        this.goalPos = goalPos;
        this.direction = direction;
    }

    public Position getGoalPos() {
        return goalPos;
    }
}

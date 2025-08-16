package creatures;
import huglife.Creature;
import huglife.Direction;
import huglife.Action;
import huglife.Occupant;
import huglife.HugLifeUtils;
import java.awt.Color;
import java.util.Map;
import java.util.List;

public class Clorus extends Creature {
    /** red color. */
    private int r;
    /** green color. */
    private int g;
    /** blue color. */
    private int b;

    /** creates plip with energy equal to E. */
    public Clorus(double e) {
        super("clorus");
        r = 34;
        g = 0;
        b = 231;
        energy = e;
    }
    public String name() {
        return "clorus";
    }

    @Override
    public void move() {
        if (energy <= 0.03) {
            energy = 0;
        } else {
            energy -= 0.03;
        }
    }

    @Override
    public void attack(Creature c) {
        energy += c.energy();
    }

    @Override
    public Creature replicate() {
        double halfEnergy = energy / 2;
        energy = halfEnergy;
        return new Plip(halfEnergy);
    }

    @Override
    public void stay() {
        if (energy <= 0.01) {
            energy = 0;
        } else {
            energy -= 0.01;
        }
    }

    @Override
    public Action chooseAction(Map<Direction, Occupant> neighbors) {
        List<Direction> empty = getNeighborsOfType(neighbors, "empty");
        List<Direction> plips = getNeighborsOfType(neighbors, "plips");
        if (empty.isEmpty()) {
            return new Action(Action.ActionType.STAY);
        } else if (!plips.isEmpty()) {
            int index = HugLifeUtils.randomInt(plips.size() - 1);
            return new Action(Action.ActionType.ATTACK, empty.get(index));
        } else if (energy >= 1) {
            int index = HugLifeUtils.randomInt(empty.size() - 1);
            return new Action(Action.ActionType.REPLICATE, empty.get(index));
        } else {
            int index = HugLifeUtils.randomInt(empty.size() - 1);
            return new Action(Action.ActionType.MOVE, empty.get(index));
        }
    }

    @Override
    public Color color() {
        return color(r, g, b);
    }
}

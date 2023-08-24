package creatures;

import huglife.Action;
import huglife.Creature;
import huglife.Direction;
import huglife.Occupant;

import java.awt.*;
import java.util.Map;

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
        r = 0;
        g = 0;
        b = 0;
        energy = e;
    }

    @Override
    public void move() {

    }

    @Override
    public void attack(Creature c) {

    }

    @Override
    public Creature replicate() {
        return null;
    }

    @Override
    public void stay() {

    }

    @Override
    public Action chooseAction(Map<Direction, Occupant> neighbors) {
        return null;
    }

    @Override
    public Color color() {
        return null;
    }
}

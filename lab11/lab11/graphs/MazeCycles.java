package lab11.graphs;

/**
 *  @author Josh Hug
 */
public class MazeCycles extends MazeExplorer {
    /* Inherits public fields:
    public int[] distTo;
    public int[] edgeTo;
    public boolean[] marked;
    */

    private Maze maze;

    public MazeCycles(Maze m) {
        super(m);
        maze = m;
    }

    @Override
    public void solve() {
        for (int i = 0; i < maze.V(); i++) {
            int count = 1;
            dfsCircle(i, count);
            distTo[i] = 0;
            edgeTo[i] = i;
            if (count < maze.V()) {
                break;
            }
         }
    }

    // Helper methods go here
    private void dfsCircle(int v, int count) {
        marked[v] = true;
        announce();
        for (int w: maze.adj(v)) {
            if (!marked[w]) {
                if (w == v) {
                    announce();
                    return;
                }
                edgeTo[w] = v;
                announce();
                distTo[w] = distTo[v] + 1;
                marked[w] = true;
                dfsCircle(v, count + 1);
                if (count == maze.V()) {
                    return;
                }
            }
        }
    }
}


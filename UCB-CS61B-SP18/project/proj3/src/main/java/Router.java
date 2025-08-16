import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Objects;
import java.util.HashMap;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class provides a shortestPath method for finding routes between two points
 * on the map. Start by using Dijkstra's, and if your code isn't fast enough for your
 * satisfaction (or the autograder), upgrade your implementation by switching it to A*.
 * Your code will probably not be fast enough to pass the autograder unless you use A*.
 * The difference between A* and Dijkstra's is only a couple of lines of code, and boils
 * down to the priority you use to order your vertices.
 */
public class Router {
    private static GraphDB.Node start;
    private static GraphDB.Node dest;
    private static GraphDB graph;
    /**
     * Return a List of longs representing the shortest path from the node
     * closest to a start location and the node closest to the destination
     * location.
     * @param g The graph to use.
     * @param stlon The longitude of the start location.
     * @param stlat The latitude of the start location.
     * @param destlon The longitude of the destination location.
     * @param destlat The latitude of the destination location.
     * @return A list of node id's in the order visited on the shortest path.
     */
    public static List<Long> shortestPath(GraphDB g, double stlon, double stlat,
                                          double destlon, double destlat) {
        start = g.getNodes().get(Long.toString(g.closest(stlon, stlat)));
        dest = g.getNodes().get(Long.toString(g.closest(destlon, destlat)));
        graph = g;
        PriorityQueue<ComparableNode> queue = new PriorityQueue<>();
        // 这个问题要注意到，一个节点最多经过一次，否则就是绕远路了
        Map<String, Boolean> mark = new HashMap<>();
        ComparableNode curr = new ComparableNode(start.id, 0, null);
        queue.add(curr);
        while (!queue.isEmpty()) {
            curr = queue.poll();
            // 要等出队列才能算经过
            mark.put(curr.id, true);
            if (Objects.equals(curr.id, dest.id)) {
                break;
            }
            for (String s: graph.getNodes().get(curr.id).adjacentNodes) {
                if (mark.containsKey(s) && mark.get(s)) {
                    continue;
                }
                ComparableNode next = new ComparableNode(g.getNodes().get(s).id,
                        curr.distance + GraphDB.distance(
                                graph.lon(Long.parseLong(curr.id)),
                                graph.lat(Long.parseLong(curr.id)),
                                graph.lon(Long.parseLong(s)),
                                graph.lat(Long.parseLong(s))), curr);
                queue.add(next);
            }
        }
        Stack<Long> stack = new Stack<>();
        for (ComparableNode w = curr; w != null; w = w.prev) {
            stack.push(Long.parseLong(w.id));
        }
        List<Long> res = new ArrayList<>();
        while (!stack.isEmpty()) {
            res.add(stack.pop());
        }
        return res;
    }

    // 这里被卡住的一点在于，hw4是直接对优先级队列设置一个比较器（Comparator），
    // 在比较器内定义了比较规则。但是我们这里，优先级并没有作为一个属性在原来的node类中给出。
    // 所以无法通过优先级来比较。如果强行在原来的node中定义优先级，又会让代码变得复杂。
    // 这里参考了网上的做法，可以考虑直接定义进入优先级队列的元素（比较手段），不一定要把node传进去。
    // 昨天晚上一直在想怎么传首末节点和best，后来想到可以将它们设置为静态类型
    /*
     * d(s, v) + ed(v, w) + h(w)
     * d(s, v): best known distance from s to v
     * ed(v, w): euclidean distance from v to w
     * h(w): euclidean distance from w to goal
     */
    private static class ComparableNode implements Comparable<ComparableNode> {
        private String id;
        private double distance;
        private double priority;
        private ComparableNode prev = null;

        private ComparableNode(String i, double d, ComparableNode r) {
            id = i;
            distance = d;
            priority = distance + distToDest(this);
            prev = r;
        }

        @Override
        public int compareTo(ComparableNode comparableNode) {
            return Double.compare(this.priority, comparableNode.priority);
        }

        private double distToDest(ComparableNode node) {
            GraphDB.Node n = graph.getNodes().get(node.id);
            return GraphDB.distance(Double.parseDouble(n.lon), Double.parseDouble(n.lat),
                    Double.parseDouble(dest.lon), Double.parseDouble(dest.lat));
        }
    }

    /**
     * Create the list of directions corresponding to a route on the graph.
     * @param g The graph to use.
     * @param route The route to translate into directions. Each element
     *              corresponds to a node from the graph in the route.
     * @return A list of NavigatiionDirection objects corresponding to the input
     * route.
     */
    public static List<NavigationDirection> routeDirections(GraphDB g, List<Long> route) {
        // optional implement
        // so I do not implement.
        return null;
    }


    /**
     * Class to represent a navigation direction, which consists of 3 attributes:
     * a direction to go, a way, and the distance to travel for.
     */
    public static class NavigationDirection {

        /** Integer constants representing directions. */
        public static final int START = 0;
        public static final int STRAIGHT = 1;
        public static final int SLIGHT_LEFT = 2;
        public static final int SLIGHT_RIGHT = 3;
        public static final int RIGHT = 4;
        public static final int LEFT = 5;
        public static final int SHARP_LEFT = 6;
        public static final int SHARP_RIGHT = 7;

        /** Number of directions supported. */
        public static final int NUM_DIRECTIONS = 8;

        /** A mapping of integer values to directions.*/
        public static final String[] DIRECTIONS = new String[NUM_DIRECTIONS];

        /** Default name for an unknown way. */
        public static final String UNKNOWN_ROAD = "unknown road";
        
        /** Static initializer. */
        static {
            DIRECTIONS[START] = "Start";
            DIRECTIONS[STRAIGHT] = "Go straight";
            DIRECTIONS[SLIGHT_LEFT] = "Slight left";
            DIRECTIONS[SLIGHT_RIGHT] = "Slight right";
            DIRECTIONS[LEFT] = "Turn left";
            DIRECTIONS[RIGHT] = "Turn right";
            DIRECTIONS[SHARP_LEFT] = "Sharp left";
            DIRECTIONS[SHARP_RIGHT] = "Sharp right";
        }

        /** The direction a given NavigationDirection represents.*/
        int direction;
        /** The name of the way I represent. */
        String way;
        /** The distance along this way I represent. */
        double distance;

        /**
         * Create a default, anonymous NavigationDirection.
         */
        public NavigationDirection() {
            this.direction = STRAIGHT;
            this.way = UNKNOWN_ROAD;
            this.distance = 0.0;
        }

        public String toString() {
            return String.format("%s on %s and continue for %.3f miles.",
                    DIRECTIONS[direction], way, distance);
        }

        /**
         * Takes the string representation of a navigation direction and converts it into
         * a Navigation Direction object.
         * @param dirAsString The string representation of the NavigationDirection.
         * @return A NavigationDirection object representing the input string.
         */
        public static NavigationDirection fromString(String dirAsString) {
            String regex = "([a-zA-Z\\s]+) on ([\\w\\s]*) and continue for ([0-9\\.]+) miles\\.";
            Pattern p = Pattern.compile(regex);
            Matcher m = p.matcher(dirAsString);
            NavigationDirection nd = new NavigationDirection();
            if (m.matches()) {
                String direction = m.group(1);
                if (direction.equals("Start")) {
                    nd.direction = NavigationDirection.START;
                } else if (direction.equals("Go straight")) {
                    nd.direction = NavigationDirection.STRAIGHT;
                } else if (direction.equals("Slight left")) {
                    nd.direction = NavigationDirection.SLIGHT_LEFT;
                } else if (direction.equals("Slight right")) {
                    nd.direction = NavigationDirection.SLIGHT_RIGHT;
                } else if (direction.equals("Turn right")) {
                    nd.direction = NavigationDirection.RIGHT;
                } else if (direction.equals("Turn left")) {
                    nd.direction = NavigationDirection.LEFT;
                } else if (direction.equals("Sharp left")) {
                    nd.direction = NavigationDirection.SHARP_LEFT;
                } else if (direction.equals("Sharp right")) {
                    nd.direction = NavigationDirection.SHARP_RIGHT;
                } else {
                    return null;
                }

                nd.way = m.group(2);
                try {
                    nd.distance = Double.parseDouble(m.group(3));
                } catch (NumberFormatException e) {
                    return null;
                }
                return nd;
            } else {
                // not a valid nd
                return null;
            }
        }

        @Override
        public boolean equals(Object o) {
            if (o instanceof NavigationDirection) {
                return direction == ((NavigationDirection) o).direction
                    && way.equals(((NavigationDirection) o).way)
                    && distance == ((NavigationDirection) o).distance;
            }
            return false;
        }

        @Override
        public int hashCode() {
            return Objects.hash(direction, way, distance);
        }
    }
}

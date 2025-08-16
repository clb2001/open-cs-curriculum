//import com.sun.org.apache.bcel.internal.generic.RETURN;

import java.util.Map;
import java.util.HashMap;

/**
 * This class provides all code necessary to take a query box and produce
 * a query result. The getMapRaster method must return a Map containing all
 * seven of the required fields, otherwise the front end code will probably
 * not draw the output correctly.
 */
public class Rasterer {
    private final double sl = 288200;

    // the overall map
    private double mapLonDPP;
    private int tileSize = 256;
    private int depth;

    // target
    private double lrlon;
    private double ullon;
    private double ullat;
    private double lrlat;
    private double w;
    private double h;
    private double lonDPP;

    public Rasterer() {
        // YOUR CODE HERE
    }

    /**
     * Takes a user query and finds the grid of images that best matches the query. These
     * images will be combined into one big image (rastered) by the front end. <br>
     *
     *     The grid of images must obey the following properties, where image in the
     *     grid is referred to as a "tile".
     *     <ul>
     *         <li>The tiles collected must cover the most longitudinal distance per pixel
     *         (LonDPP) possible, while still covering less than or equal to the amount of
     *         longitudinal distance per pixel in the query box for the user viewport size. </li>
     *         <li>Contains all tiles that intersect the query bounding box that fulfill the
     *         above condition.</li>
     *         <li>The tiles must be arranged in-order to reconstruct the full image.</li>
     *     </ul>
     *
     * @param params Map of the HTTP GET request's query parameters - the query box and
     *               the user viewport width and height.
     *
     * @return A map of results for the front end as specified: <br>
     * "render_grid"   : String[][], the files to display. <br>
     * "raster_ul_lon" : Number, the bounding upper left longitude of the rastered image. <br>
     * "raster_ul_lat" : Number, the bounding upper left latitude of the rastered image. <br>
     * "raster_lr_lon" : Number, the bounding lower right longitude of the rastered image. <br>
     * "raster_lr_lat" : Number, the bounding lower right latitude of the rastered image. <br>
     * "depth"         : Number, the depth of the nodes of the rastered image <br>
     * "query_success" : Boolean, whether the query was able to successfully complete; don't
     *                    forget to set this to true on success! <br>
     */
    // 尽量保证分辨率够用（联系自己用地图的习惯，放大到看得见就行）
    public Map<String, Object> getMapRaster(Map<String, Double> params) {
        Map<String, Object> results = new HashMap<>();
        depth = 0;
        mapLonDPP = (MapServer.ROOT_LRLON - MapServer.ROOT_ULLON) * sl / tileSize;
        lrlon = params.get("lrlon");
        ullon = params.get("ullon");
        w = params.get("w"); // longitudinal
        h = params.get("h"); // latitudinal
        ullat = params.get("ullat");
        lrlat = params.get("lrlat");
        depth = getDepth();
        results.put("raster_ul_lon", getRange(MapServer.ROOT_ULLON, MapServer.ROOT_LRLON,
                depth, ullon, false));
        results.put("raster_ul_lat", getRange(MapServer.ROOT_LRLAT, MapServer.ROOT_ULLAT,
                depth, ullat, true));
        results.put("raster_lr_lon", getRange(MapServer.ROOT_ULLON, MapServer.ROOT_LRLON,
                depth, lrlon, true));
        results.put("raster_lr_lat", getRange(MapServer.ROOT_LRLAT, MapServer.ROOT_ULLAT,
                depth, lrlat, false));
        results.put("depth", depth);
        if (ullon < lrlon && ullat > lrlat
                && ullon >= MapServer.ROOT_ULLON && lrlon <= MapServer.ROOT_LRLON
                && ullat <= MapServer.ROOT_ULLAT && lrlat >= MapServer.ROOT_LRLAT) {
            results.put("query_success", true);
            results.put("render_grid", getRenderGrid(ullon, ullat, lrlon, lrlat, depth));
        } else {
            results.put("query_success", false);
            results.put("render_grid", null);
        }
        return results;
    }

    public double getMapLonDPP() {
        return mapLonDPP;
    }

    private void setMapLonDPP() {
        if (depth > 7) {
            mapLonDPP = (MapServer.ROOT_LRLON - MapServer.ROOT_ULLON)
                    * 288200 / 256 / Math.pow(2, 7);
        } else {
            mapLonDPP = (MapServer.ROOT_LRLON - MapServer.ROOT_ULLON)
                    * 288200 / 256 / Math.pow(2, depth);
        }
    }

    private double getLonDPP() {
        return sl * (lrlon - ullon) / w;
    }

    private int getDepth() {
        lonDPP = getLonDPP();
        while (lonDPP < mapLonDPP && depth < 7) {
            depth += 1;
            setMapLonDPP();
        }
        return depth;
    }

    // 其实这里完全不用设置min和max参数
    private double getRange(double min, double max, int d, double value, boolean flag) {
        boolean f = false;
        double range = min;
        int level = (int) Math.pow(2, d);
        for (int i = 0; i < level - 1; i++) {
            double l = min + (double) i / level * (max - min);
            double r = min + (double) (i + 1) / level * (max - min);
            if (flag && value > l && value <= r) {
                range = r;
                f = true;
                break;
            } else if (!flag && value >= l && value < r) {
                range = l;
                f = true;
                break;
            }
        }
        if (!f) {
            range = max;
        }
        return range;
    }

    private int getIndex(double min, double max, int d, double value, int flag) {
        int index = 0;
        int level = (int) Math.pow(2, d);
        for (int i = 0; i < level; i++) {
            double l = min + (double) i / level * (max - min);
            double r = min + (double) (i + 1) / level * (max - min);
            if (flag == 1 && value > l && value <= r) {
                index = i;
                break;
            } else if (flag == 2 && value >= l && value < r) {
                index = i + 1;
                break;
            } else if (flag == 3 && value > l && value <= r) {
                index = level - i - 1;
                break;
            } else if (flag == 4 && value >= l && value < r) {
                index = level - i;
                break;
            }
        }
        return index;
    }

    // 自己一个月前写的代码感觉完全不能看(已删除)
    private String[][] getRenderGrid(
            double ulLon, // LEFT LON
            double ulLat, // TOP LAT
            double lrLon, // RIGHT LON
            double lrLat, // DOWN LAT
            int d
    ) {
        // 只要确定左上角和右下角节点在哪里就好了
        int left = getIndex(MapServer.ROOT_ULLON, MapServer.ROOT_LRLON, d, ulLon, 1);
        int right = getIndex(MapServer.ROOT_ULLON, MapServer.ROOT_LRLON, d, lrLon, 2);
        int up = getIndex(MapServer.ROOT_LRLAT, MapServer.ROOT_ULLAT, d, ulLat, 3);
        int down = getIndex(MapServer.ROOT_LRLAT, MapServer.ROOT_ULLAT, d, lrLat, 4);
        return generateArray(left, right, up, down, d);
    }

    public static String[][] generateArray(int left, int right, int up, int down, int depth) {
        int height = down - up;
        int width = right - left;
        String[][] array = new String[height][width];
        for (int i = 0; i < height; i++) {
            for (int j = 0; j < width; j++) {
                array[i][j] = "d" + depth + "_x" + (left + j) + "_y" + (up + i) + ".png";
            }
        }
        return array;
    }
}

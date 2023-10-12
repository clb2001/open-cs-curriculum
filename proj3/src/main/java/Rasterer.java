//import com.sun.org.apache.bcel.internal.generic.RETURN;

import java.util.*;

/**
 * This class provides all code necessary to take a query box and produce
 * a query result. The getMapRaster method must return a Map containing all
 * seven of the required fields, otherwise the front end code will probably
 * not draw the output correctly.
 */
public class Rasterer {
    private final double s_l = 288200;

    // the overall map
    private double map_lonDPP;
    private int tile_size = 256;
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
        map_lonDPP = (MapServer.ROOT_LRLON - MapServer.ROOT_ULLON) * s_l / tile_size;
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
        if (ullon <= lrlon && ullat >= lrlat
                && ullon >= MapServer.ROOT_ULLON && lrlon <= MapServer.ROOT_LRLON
                && ullat <= MapServer.ROOT_ULLAT && lrlat >= MapServer.ROOT_LRLAT) {
            results.put("query_success", true);
            results.put("render_grid", getRender_grid(ullon, ullat, lrlon, lrlat, depth));
        } else {
            results.put("query_success", false);
            results.put("render_grid", null);
        }
        return results;
    }

    public double getMap_lonDPP() {
        return map_lonDPP;
    }

    private void setMap_lonDPP() {
        if (depth > 7) {
            map_lonDPP = (MapServer.ROOT_LRLON - MapServer.ROOT_ULLON) * 288200 / 256 / Math.pow(2, 7);
        } else {
            map_lonDPP = (MapServer.ROOT_LRLON - MapServer.ROOT_ULLON) * 288200 / 256 / Math.pow(2, depth);
        }
    }

    private double getLonDPP() {
        return s_l * (lrlon - ullon) / w;
    }

    private int getDepth() {
        lonDPP = getLonDPP();
        while (lonDPP < map_lonDPP && depth < 7) {
            depth += 1;
            setMap_lonDPP();
        }
        return depth;
    }

    private double getRange(double min, double max, int depth, double value, boolean flag) {
        double range = min;
        int level = (int)Math.pow(2, depth);
        for (int i = 0; i < level - 1; i++) {
            double l = min + (double) i / level * (max - min);
            double r = min + (double) (i + 1) / level * (max - min);
            if (flag && value > l && value <= r) {
                range = r;
                break;
            } else if (!flag && value >= l && value < r) {
                range = l;
                break;
            }
        }
        return range;
    }

    private int getIndex(double min, double max, int depth, double value, boolean flag) {
        int index = 0;
        int level = (int)Math.pow(2, depth);
        for (int i = 0; i < level - 1; i++) {
            double l = min + (double) i / level * (max - min);
            double r = min + (double) (i + 1) / level * (max - min);
            if (flag && value > l && value <= r) {
                index = i + 1;
                break;
            } else if (!flag && value >= l && value < r) {
                index = i;
                break;
            }
        }
        return index;
    }

    // 自己一个月前写的代码感觉完全不能看(已删除)
    private String[][] getRender_grid(
            double ul_lon, // LEFT LON
            double ul_lat, // TOP LAT
            double lr_lon, // RIGHT LON
            double lr_lat, // DOWN LAT
            int depth
    ) {
        // 只要确定左上角和右下角节点在哪里就好了
        int s = (int)Math.pow(2, depth);
        int left = getIndex(MapServer.ROOT_ULLON, MapServer.ROOT_LRLON, depth, ul_lon, false);
        int right = getIndex(MapServer.ROOT_ULLON, MapServer.ROOT_LRLON, depth, lr_lon, true);
        int up = s - getIndex(MapServer.ROOT_LRLAT, MapServer.ROOT_ULLAT, depth, ul_lat, true);
        int down = s - getIndex(MapServer.ROOT_LRLAT, MapServer.ROOT_ULLAT, depth, lr_lat, false);
        return generateArray(left, right, up, down, depth);
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

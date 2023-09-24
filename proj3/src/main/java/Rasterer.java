import com.sun.org.apache.bcel.internal.generic.RETURN;

import java.util.*;

/**
 * This class provides all code necessary to take a query box and produce
 * a query result. The getMapRaster method must return a Map containing all
 * seven of the required fields, otherwise the front end code will probably
 * not draw the output correctly.
 */
public class Rasterer {
    private final double s_l = 288200;
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

    public void mapRaster(Map<String, Object> params) {

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
    public Map<String, Object> getMapRaster(Map<String, Double> params) {
        System.out.println("params: " + params);
        Map<String, Object> results = new HashMap<>();
        lrlon = params.get("lrlon");
        ullon = params.get("ullon");
        w = params.get("w");
        h = params.get("h");
        ullat = params.get("ullat");
        lrlat = params.get("lrlat");
        lonDPP = (lrlon - ullon) * s_l / w;
        get_raster_info(MapServer.ROOT_ULLON, MapServer.ROOT_ULLAT,
                MapServer.ROOT_LRLON, MapServer.ROOT_LRLAT,
                lonDPP, s_l, w, 0, results);
        System.out.println(results);
        return results;
    }

    private void get_raster_info(
            double ul_lon, double ul_lat, double lr_lon, double lr_lat,
            double lonDPP, double refactor, double width, int depth,
            Map<String, Object> params) {
        if (depth >= 7) {
            params.put("raster_ul_lon", ul_lon);
            params.put("raster_ul_lat", ul_lat);
            params.put("raster_lr_lon", lr_lon);
            params.put("raster_lr_lat", lr_lat);
            params.put("depth", 7);
        } else {
            double temp = (lr_lon - ul_lon) * refactor / width;
            if (temp < lonDPP) {
                // should calculate other parameters
                params.put("raster_ul_lon", ul_lon);
                params.put("raster_ul_lat", ul_lat);
                params.put("raster_lr_lon", lr_lon);
                params.put("raster_lr_lat", lr_lat);
                params.put("depth", depth);
            } else {
                get_raster_info(ul_lon, ul_lat, lr_lon, lr_lat,
                        lonDPP, refactor, depth, depth + 1, params);


            }
        }
    }
}

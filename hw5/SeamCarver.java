import edu.princeton.cs.algs4.Picture;

public class SeamCarver {
    // 这个homework一定要先处理好矩阵再做，否则很容易陷入混乱。
    // 2023.8.20于文图
    private Picture picture;
    private int width;
    private int height;
    private boolean transpose;

    public SeamCarver(Picture picture) {
        this.picture = picture;
        this.width = picture.width();
        this.height = picture.height();
        this.transpose = false;
    }

    // current picture
    public Picture picture() {
        return picture;
    }

    // width of current picture
    public int width() {
        return width;
    }

    // height of current picture
    public int height() {
        return height;
    }

    // energy of pixel at column x and row y
    public double energy(int x, int y) {
        if (x < 0 || x >= width || y < 0 || y >= height) {
            throw new IndexOutOfBoundsException();
        }
        int[] rgbLeft;
        int[] rgbRight;
        int[] rgbUp;
        int[] rgbDown;

        if (!transpose) {
            rgbRight = (x < width - 1 ? getRGBArr(x + 1, y) : getRGBArr(0, y));
            rgbLeft = (x > 0 ? getRGBArr(x - 1, y) : getRGBArr(width - 1, y));
            rgbUp = (y < height - 1 ? getRGBArr(x, y + 1) : getRGBArr(x, 0));
            rgbDown = (y > 0 ? getRGBArr(x, y - 1) : getRGBArr(x, height - 1));
        } else {
            rgbUp = (x < height - 1 ? getRGBArr(x + 1, y) : getRGBArr(0, y));
            rgbDown = (x > 0 ? getRGBArr(x - 1, y) : getRGBArr(height - 1, y));
            rgbRight = (y < width - 1 ? getRGBArr(x, y + 1) : getRGBArr(x, 0));
            rgbLeft = (y > 0 ? getRGBArr(x, y - 1) : getRGBArr(x, width - 1));
        }

        double Rx = Math.pow(rgbRight[0] - rgbLeft[0], 2);
        double Gx = Math.pow(rgbRight[1] - rgbLeft[1], 2);
        double Bx = Math.pow(rgbRight[2] - rgbLeft[2], 2);
        double Ry = Math.pow(rgbUp[0] - rgbDown[0], 2);
        double Gy = Math.pow(rgbUp[1] - rgbDown[1], 2);
        double By = Math.pow(rgbUp[2] - rgbDown[2], 2);
        return Rx + Ry + Gx + Gy + Bx + By;
    }

    // sequence of indices for horizontal seam
    public int[] findHorizontalSeam() {
        double[][] e = new double[width][height];
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                e[i][j] = energy(i, j);
            }
        }

        double[][] minEnergy = new double[width][height];
        int[][] minPath = new int[width][height];
        for (int i = 0; i < width; i++) {
            minEnergy[i][0] = e[i][0];
            minPath[i][0] = i;
        }

        for (int i = 0; i < width; i++) {
            for (int j = 1; j < height; j++) {
                if (i == 0) {
                    minEnergy[i][j] = e[i][j] + Math.min(minEnergy[i][j - 1], minEnergy[i + 1][j - 1]);
                    minPath[i][j] = (minEnergy[i][j - 1] < minEnergy[i + 1][j - 1])? i : i + 1;
                } else if (i == width - 1) {
                    minEnergy[i][j] = e[i][j] + Math.min(minEnergy[i - 1][j - 1], minEnergy[i][j - 1]);
                    minPath[i][j] = (minEnergy[i][j - 1] < minEnergy[i - 1][j - 1])? i : i - 1;
                } else {
                    double tmp = Math.min(minEnergy[i - 1][j - 1], minEnergy[i + 1][j - 1]);
                    minPath[i][j] = (minEnergy[i + 1][j - 1] < minEnergy[i - 1][j - 1])? i + 1 : i - 1;
                    minEnergy[i][j] = e[i][j] + Math.min(tmp, minEnergy[i - 1][j - 1]);
                    minPath[i][j] = (minEnergy[i][j] < minPath[i][j])? i : minPath[i][j];
                }
            }
        }

        int flag = 0;
        double cost = minEnergy[0][height - 1];
        for (int i = 1; i < width; i++) {
            if (minEnergy[i][height - 1] < cost) {
                flag = i;
                cost = minEnergy[i][height - 1];
            }
        }

        return minPath[flag];
    }

    // sequence of indices for vertical seam
    // refer to other answers to avoid copying.
    public int[] findVerticalSeam() {
        transpose = true;
        swap();
        int[] res = findHorizontalSeam();
        swap();
        transpose = false;
        return res;
    }

    // remove horizontal seam from picture
    public void removeHorizontalSeam(int[] seam) {
        if (seam.length != height) {
            throw new IllegalArgumentException();
        }
        for (int i = 1; i < seam.length; i++) {
            if (Math.abs(seam[i] - seam[i - 1]) > 1) {
                throw new IllegalArgumentException();
            }
        }
        picture = SeamRemover.removeHorizontalSeam(picture, seam);
    }

    // remove vertical seam from picture
    public void removeVerticalSeam(int[] seam) {
        if (seam.length != width) {
            throw new IllegalArgumentException();
        }
        for (int i = 1; i < seam.length; i++) {
            if (Math.abs(seam[i] - seam[i - 1]) > 1) {
                throw new IllegalArgumentException();
            }
        }
        picture = SeamRemover.removeVerticalSeam(picture, seam);
    }

    private int[] getRGBArr(int x, int y) {
        if (x < 0 || x >= width || y < 0 || y >= height) {
            throw new IndexOutOfBoundsException();
        }
        int[] arr = new int[3];
        int rgb = picture.getRGB(x, y);
        arr[0] = (rgb >> 16) & 0xFF;
        arr[1] = (rgb >> 8) & 0xFF;
        arr[2] = (rgb) & 0xFF;
        return arr;
    }

    private void swap() {
        int tmp = height;
        height = width;
        width = tmp;
    }
}

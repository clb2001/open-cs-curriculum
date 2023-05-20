public class NBody {
    public static double readRadius(String planetsTxtPath){
        // not execute BasicInDemo.java!
        In in = new In(planetsTxtPath);
        int firstItemInFile = in.readInt();
        return in.readDouble();
    }

    public static Planet[] readPlanets(String planetsTxtPath){
        In in = new In(planetsTxtPath);
        int firstItemInFile = in.readInt();
        double secondItemInFile = in.readDouble();
        Planet[] A = new Planet[firstItemInFile];
        int i = 0;
        // not !in.isEmpty()
        while (i < firstItemInFile){
            double xP = in.readDouble();
            double yP = in.readDouble();
            double xV = in.readDouble();
            double yV = in.readDouble();
            double m = in.readDouble();
            String img = in.readString();
            Planet temp = new Planet(xP, yP, xV, yV, m, img);
            A[i] = temp;
            i++;
        }
        return A;
    }

    public static String imageToDraw = "images/starfield.jpg";

    public static void main(String[] args){
        double T = Double.parseDouble(args[0]);
        double dt = Double.parseDouble(args[1]);
        String filename = args[2];
        double radius = readRadius(filename);
        Planet[] planets = readPlanets(filename);

        StdDraw.setScale(-radius, radius);

        StdDraw.enableDoubleBuffering();

        double t;
        for (t = 0.0; t < T; t += dt){
            double[] xForces = new double[planets.length];
            double[] yForces = new double[planets.length];
            for (int i = 0; i < planets.length; i++) {
                // not xForces[i] = Planet.calcNetForceExertedByX(A);
                xForces[i] = planets[i].calcNetForceExertedByX(planets);
                yForces[i] = planets[i].calcNetForceExertedByY(planets);
            }
            for (int i = 0; i < planets.length; i++){
                planets[i].update(dt, xForces[i], yForces[i]);
            }
            StdDraw.picture(0, 0, imageToDraw);

            /* Shows the drawing to the screen. */
            StdDraw.show();
            for (Planet planet: planets){
                planet.draw();
            }
            StdDraw.show();
            StdDraw.pause(10);
        }

        StdOut.printf("%d\n", planets.length);
        StdOut.printf("%.2e\n", radius);
        for (Planet planet : planets) {
            StdOut.printf("%11.4e %11.4e %11.4e %11.4e %11.4e %12s\n",
                    planet.xxPos, planet.yyPos, planet.xxVel,
                    planet.yyVel, planet.mass, planet.imgFileName);
        }
    }
}

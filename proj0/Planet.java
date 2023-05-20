public class Planet {
    public double xxPos;
    public double yyPos;
    public double xxVel;
    public double yyVel;
    public double mass;
    public String imgFileName;

    public static final double G = 6.67e-11;

    public Planet(double xP, double yP, double xV,
                  double yV, double m, String img){
        xxPos = xP;
        yyPos = yP;
        xxVel = xV;
        yyVel = yV;
        mass = m;
        imgFileName = img;
    }

    public Planet(Planet p){
        xxPos = p.xxPos;
        yyPos = p.yyPos;
        xxVel = p.xxVel;
        yyVel = p.yyVel;
        mass = p.mass;
        imgFileName = p.imgFileName;
    }

    public double calcDistance(Planet rocinante){
        double x = xxPos - rocinante.xxPos;
        double y = yyPos - rocinante.yyPos;
        return Math.sqrt(x * x + y * y);
    }

    public double calcForceExertedBy(Planet rocinante){
        return G * mass * rocinante.mass / (calcDistance(rocinante) * calcDistance(rocinante));
    }

    public double calcForceExertedByX(Planet rocinante){
        return calcForceExertedBy(rocinante) * (rocinante.xxPos - xxPos) / calcDistance(rocinante);
    }

    public double calcForceExertedByY(Planet rocinante){
        return calcForceExertedBy(rocinante) * (rocinante.yyPos - yyPos) / calcDistance(rocinante);
    }

    public double calcNetForceExertedByX(Planet[] allPlanets){
        double x = 0;
        for (Planet allPlanet : allPlanets) {
            if (!allPlanet.equals(this)) {
                x += calcForceExertedByX(allPlanet);
            }
        }
        return x;
    }

    public double calcNetForceExertedByY(Planet[] allPlanets){
        double y = 0;
        for (Planet allPlanet : allPlanets) {
            if (!allPlanet.equals(this)) {
                y += calcForceExertedByY(allPlanet);
            }
        }
        return y;
    }

    public void update(double dt, double fX, double fY){
        double ax = fX / mass;
        double ay = fY / mass;
        xxVel = xxVel + ax * dt;
        yyVel = yyVel + ay * dt;
        xxPos = xxPos + xxVel * dt;
        yyPos = yyPos + yyVel * dt;
    }

    public void draw(){
        StdDraw.picture(xxPos, yyPos, "images/"+ imgFileName);
        StdDraw.show();
    }

}

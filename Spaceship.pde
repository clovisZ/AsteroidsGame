class Spaceship extends Floater  
{  
    public Spaceship() {
      myCenterX = width/2;
      myCenterY = height/2;
      myColor = color(146, 153, 158);
      corners = 22;
      xCorners = new int[]{-19, -23, -22, -18, -13, -12, -6, 0, 10, 8, 22, 26, 22, 8, 10, 0, -6, -12, -13, -18, -22, -23, -19};
      yCorners = new int[]{0, 8, 12, 12, 3, 20, 19, 10, 8, 4, 4, 0, -4, -4, -8, -10, -19, -20, -3, -12, -12, -8, 0};
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
    }
    public void hyperspace() {
      myCenterX = (int)(Math.random() * width);
      myCenterY = (int)(Math.random() * height);
      myXspeed = 0;
      myYspeed = 0;
      turn((int)(Math.random() * 360));
    }
    public double getCenterX() {
      return myCenterX; 
    }
    public double getCenterY() {
      return myCenterY; 
    }
    public double getPointDirection() {
      return myPointDirection;
    }
    public double getXspeed() {
      return myXspeed; 
    }
    public double getYspeed() {
      return myYspeed; 
    }
}

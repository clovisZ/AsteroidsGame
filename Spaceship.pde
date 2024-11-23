class Spaceship extends Floater  
{  
    public Spaceship() {
      myCenterX = width/2;
      myCenterY = height/2;
      myColor = color(252, 164, 126);
      corners = 4;
      xCorners = new int[]{-8, 16, -8, -2};
      yCorners = new int[]{-8, 0, 8, 0};
      myXspeed = 0;
      myYspeed = 0;
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

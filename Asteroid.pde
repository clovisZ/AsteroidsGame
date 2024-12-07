class Asteroid extends Floater {
  protected double rotationSpeed;
  protected int[][] xShapes = {
    {-14, 42, 14, 21, -49},
    {-21, 0, 42, 28, -14, -42},
    {-28, 42, 56, 21, -14, -35, -28},
  };
  protected int[][] yShapes = {
    {35, 35, -14, -28, -7},
    {28, 42, 7, -28, -35, -7},
    {28, 14, 0, -21, -28, -14, 7},
  };

  public Asteroid() {
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myColor = color((int)(Math.random()*70 + 30));
    int shape = (int)(Math.random()*3);
    corners = xShapes[shape].length;
    xCorners = new int[xShapes[shape].length];
    yCorners = new int[yShapes[shape].length];
    for (int i = 0; i < xShapes[shape].length; i++) {
      xCorners[i] = xShapes[shape][i];
      yCorners[i] = yShapes[shape][i];
    }
    myXspeed = Math.random()*8 - 4;
    myYspeed = Math.random()*8 - 4;
    myPointDirection = (int)(Math.random()*360);
    rotationSpeed = (int)(Math.random()*10-5);

  }
  public void move() {
    turn(rotationSpeed);
   
    myCenterX += myXspeed;
    myCenterY += myYspeed;
   
    //wrap around screen    
    if(myCenterX >width)
    {    
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {    
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }
   
    else if (myCenterY < 0)
    {    
      myCenterY = height;    
    }  
  }
}

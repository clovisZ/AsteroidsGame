class Bullet extends Floater {
  public Bullet() {
    myCenterX = ship.getCenterX();
    myCenterY = ship.getCenterY();
    myColor = color(247, 190, 23);
    corners = 4;
    xCorners = new int[]{-30, 30, 30, -30};
    yCorners = new int[]{1, 1, -1, -1};
    myXspeed = 10;
    myYspeed = 10;
    myPointDirection = ship.getPointDirection();
  }
  
  public void move () {      
    myCenterX += cos((float)(myPointDirection*(Math.PI/180))) * myXspeed;    
    myCenterY += sin((float)(myPointDirection*(Math.PI/180))) * myYspeed;   
  }
 
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the bullet to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      curveVertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}

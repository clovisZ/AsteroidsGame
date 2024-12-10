class Star 
{  
    private int myX, myY, size, myColor;
    public Star() {
      myX = (int)(Math.random() * width);
      myY = (int)(Math.random() * height);
      size = (int)(Math.random() * 3) + 1;
      myColor = color(255);
    }
    public void show() {
      fill(myColor);
      ellipse(myX, myY, size, size);
    }
}

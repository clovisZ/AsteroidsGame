Spaceship ship;
Star [] nightSky = new Star[100];

void setup() {
  size(800, 800);
  ship = new Spaceship();
  for (int i = 0; i < nightSky.length; i++) 
    nightSky[i] = new Star();
  
}

void draw() {
  background(10);
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i].show();
  }
  ship.show();
  ship.move();
  text("myCenterX: " + ship.getCenterX(), 10, 20);
  text("myCenterY: " + ship.getCenterY(), 10, 40);
  text("myPointDirection: " + ship.getPointDirection(), 10, 60);
  text("myXSpeed: " + ship.getXspeed(), 10, 80);
  text("myYSpeed: " + ship.getYspeed(), 10, 100);
}

void keyPressed() {
  if (key == 'w')
    ship.accelerate(0.5);
  if (key == 'a') 
    ship.turn(-10);
  if (key == 's')
    ship.accelerate(-0.5);
  if (key == 'd')
    ship.turn(10);
  if (key == 'h')
    ship.hyperspace();
}

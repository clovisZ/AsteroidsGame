Spaceship ship;
Star[] nightSky;
int health;
int space;
boolean start;
boolean wHeld, aHeld, sHeld, dHeld;

ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();

void setup() {
  size(800, 800);
  ship = new Spaceship();
  nightSky = new Star[100];
  health = 3;
  start = false;  
  wHeld = aHeld = sHeld = dHeld = false;
  textSize(50);
  textAlign(CENTER);
  for (int i = 0; i < nightSky.length; i++)
    nightSky[i] = new Star();
  for (int i = 0; i < 6; i++)
    asteroids.add(new Asteroid());
}

void draw() {
  noStroke();
  background(10);
  space = 0;
  if (!start) {
    fill(255);
    text("Press Any Key to Begin!", width/2, height/2);
  }
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i].show();
  }
  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
  }
  if (wHeld) 
    ship.accelerate(0.2);
  if (aHeld) 
    ship.turn(-5);
  if (sHeld)
    ship.accelerate(-0.2);
  if (dHeld)
    ship.turn(5);
  ship.show();
  ship.move();
  pushMatrix();
    translate((float)ship.getCenterX() - (15 * health + 4 * (health - 1))/2, (float) (ship.getCenterY() - 40));
    noStroke();
    fill(250, 0, 0);
    for (int i = 0; i < health; i++) {
      rect(space, 0, 15, 5);
      space+=19;
    }
  popMatrix();
  if (health == 0) {
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER!!", width/2, height/2);
    noLoop();
  }
  if (start) {
    for (int i = 0; i < asteroids.size(); i++) {
      if (dist((float)asteroids.get(i).myCenterX, (float)asteroids.get(i).myCenterY, (float)ship.myCenterX, (float)ship.myCenterY) <= 60) {
        asteroids.remove(i);
        health--;
      }
    }
  }
}

void keyPressed() {
  start = true;
  if (key == 'w' || key == 'W')
    wHeld = true;
  if (key == 'a' || key == 'A')
    aHeld = true;
  if (key == 's' || key == 'S')
    sHeld = true;
  if (key == 'd' || key == 'D')
    dHeld = true;
  if (key == 'h' || key == 'H')
    ship.hyperspace();
}

void keyReleased() {
  if (key == 'w' || key == 'W')
    wHeld = false;
  if (key == 'a' || key == 'A')
    aHeld = false;
  if (key == 's' || key == 'S')
    sHeld = false;
  if (key == 'd' || key == 'D')
    dHeld = false;
}

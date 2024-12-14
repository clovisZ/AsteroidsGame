Spaceship ship;
Star[] nightSky;
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int health;
float maxAmmo;
float ammo;
int healthSpace;
int ammoSpace;
boolean start;
boolean wHeld, aHeld, sHeld, dHeld, spaceHeld;


void setup() {
  size(800, 800);
  ship = new Spaceship();
  nightSky = new Star[100];
  health = 3;
  maxAmmo = 50;
  ammo = 50;
  start = false;  
  wHeld = aHeld = sHeld = dHeld = false;
  textSize(50);
  textAlign(CENTER);
  for (int i = 0; i < nightSky.length; i++)
    nightSky[i] = new Star();
  for (int i = 0; i < 10; i++)
    asteroids.add(new Asteroid());
}

void draw() {
  noStroke();
  background(10);
  healthSpace = 0;
  ammoSpace = 0;
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
  if (spaceHeld)
    if (ammo != 0) {
      bullets.add(new Bullet());
      ammo--;
    }
  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).move();
    bullets.get(i).show();
  }
  ship.move();
  ship.show();
  if (health == 0) {
    textSize(50);
    textAlign(CENTER);
    fill(255, 0, 0);
    text("GAME OVER!!", width/2, height/2);
    noLoop();
  }
  if (asteroids.size() == 0) {
    fill(0, 255, 0);
    text("VICTORY!", width/2, height/2);
    noLoop();
  }
  if (ammo == 0) {
    fill(255, 0, 0);
    text("GAME OVER!!", width/2, height/2);
    noLoop();
  }
  if (start) {
    for (int i = 0; i < asteroids.size(); i++) {
      if (dist((float)asteroids.get(i).myCenterX, (float)asteroids.get(i).myCenterY, (float)ship.myCenterX, (float)ship.myCenterY) <= 60) {
        asteroids.remove(i);
        health--;
        break;
      }
      for (int j = 0; j < bullets.size(); j++) {
        if (dist((float)asteroids.get(i).myCenterX, (float)asteroids.get(i).myCenterY, (float)bullets.get(j).myCenterX, (float)bullets.get(j).myCenterY) <= 60) {
          asteroids.remove(i);
          bullets.remove(j);
          break;
        }
      }
    }
  }
  pushMatrix();
    translate((float)ship.myCenterX - (15 * health + 5 * (health - 1))/2, (float) (ship.myCenterY - 50));
    noStroke();
    fill(250, 0, 0);
    for (int i = 0; i < health; i++) {
      rect(healthSpace, 0, 15, 5);
      healthSpace+=20;
    }
    fill(247, 190, 23);
    float ammoBarWidth = 55 * (ammo/maxAmmo);
    rect(0, 10, ammoBarWidth, 5);
  popMatrix();
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
  if (key == 32)
    spaceHeld = true;
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
  if (key == 32)
    spaceHeld = false;
}

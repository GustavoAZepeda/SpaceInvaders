PImage rocketImg;
Rocket rocket;
Points points;

void setup() {
  size(500, 500);
  background(0, 0, 0);
  rocketImg = loadImage("rocket.png");
  rocket = new Rocket();
  points = new Points();
}

void draw() {
  background(0, 0, 0);
  rocket.display();
  points.display();
  points.move();
  if (rocket.collides(points)) {
    points.reset();
    rocket.score++;
  }
  rocket.showScore();
}

void keyPressed() {
  if (key == 'a') {
    rocket.x -= 10;
  }
  if (key == 'd') {
    rocket.x += 10;
  }
}

class Rocket {
  int x = 250;
  int y = 400;
  int score = 0;
  
  void display() {
    image(rocketImg, x-25, y-25, 50, 50);
  }
  
  void showScore() {
    textSize(32);
    fill(255, 255, 255);
    text("Score: " + score, 10, 40);
  }
  
  boolean collides(Points points) {
    return dist(x, y, points.x, points.y) < 50;
  }
}

class Points {
  int x = 250;
  int y = 50;
  int speed = 2;
  
  void display() {
    fill(0, 0, 255);
    rect(x, y, 50, 50);
  }
  
  void move() {
    y += speed;
    if (y > 450) {
      reset();
    }
  }
  
  void reset() {
    y = 50;
    x = (int)random(0, 450);
  }
}

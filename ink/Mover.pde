// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  // location, velocity, and acceleration 
  PVector prevLocation;
  PVector location;
  PVector velocity;
  PVector acceleration;

  // Mass is tied to size
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    prevLocation = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void updateDrag(int mX, int mY) {
//    this.location.set(mX, mY);

//    float distVecX = dist(prevLocation.x, mX);
//    float distVecX = dist(prevLocation.y, mY);
    
    
    
    
    this.location.x =  mX + prevLocation.x;
    this.location.y =  mY + prevLocation.y;
//    this.location.y =  mY;
//    
//    this.location.x = this.prevLocation.x - mX;
//    this.location.y = this.prevLocation.y - mY;
//    
    this.prevLocation = this.location;
  }

  void update() {

    this.prevLocation = this.location;

    // Velocity changes according to acceleration
    this.velocity.add(this.acceleration);
    // Location changes by velocity
    this.location.add(this.velocity);
    // We must clear acceleration each frame
    this.acceleration.mult(0);
  }

  // Draw Mover
//  float noiseWalker(float pos) {
//
//
//    return map(noise(1), 0, 1, 0, 1);
//  }


  

  void display() {

    float cx1, cx2, cy1, cy2;
    cx1 = 0.0;
    cy1 = 0.0;
    cx2 = 0.0;
    cy2 = 0.0;

    stroke(0, 150);
    //    strokeWeight(noise(100,200));
    strokeWeight(random(0.1, 2));
    //fill(127, 200);
    line(prevLocation.x, prevLocation.y, location.x, location.y);
    noFill();
//    bezier(prevLocation.x, prevLocation.y, prevLocation.x + cx1 + noise(cx1) +random(-1, 1), prevLocation.y + cy1  + noise(0, 2), location.x, location.y, location.x + cx2 + noise(0, 20)  + random(-1, 1), location.y + cy2 + noise(0, 20)  + random(0, 1)); 
    //    bezier(prevLocation.x, prevLocation.y, prevLocation.x + cx1 + noise(prevLocation.x), prevLocation.y + cy1  + noise(prevLocation.y), location.x, location.y, location.x + cx2 + noise(location.x), location.y + cy2 + noise(location.y));


    // ellipse(location.x, location.y, mass, mass);
    //println( prevLocation.y +" , " +  location.y);
  }

  // Bounce off bottom of window
  void checkEdges() {
    if (location.y > height) {
      velocity.y *= 0;  // A little dampening when hitting the bottom
      location.y = height;
    }
  }

  boolean checkFinger(Finger f) {


    return (this.location.dist(f.pos) < f.radius);
  }
}


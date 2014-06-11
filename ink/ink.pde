// todo
// Resolver o bug do atrito

PVector baseBlow;
PImage fundo; 
PImage edgeImage;

//Finger cursor;

ArrayList<Mover> movers;

void setup() {
  size(525, 700);
  //  background(255);

  //  cursor = new Finger(30);
  movers = new ArrayList<Mover>();

  fundo = loadImage("pequenosreparos.jpg");

  image(fundo, 0, 0);

  createDots("edge.jpg");
  smooth();
  baseBlow = new PVector(width/2, height);
}

void draw() {
  //  fill(255,10);
  //  rect(0,0,width,height);
//  image(fundo, 0, 0);
  //  cursor.display();
  //  cursor.update();


  for (int i = 0; i < movers.size(); i++) {

    Mover movers_ = movers.get(i);

    friction(movers_);

    // Update and display
    movers_.update();
    movers_.display();
    movers_.checkEdges();
  }

  ellipse(baseBlow.x, baseBlow.y, 30, 30);
}

void mousePressed() {
  //  blow();
}


void drag() {
}

void blow() {
  for (int i = 0; i < movers.size(); i++) {
    Mover movers_ = movers.get(i);

    PVector actualLoc = movers_.location;
    float magBlowX;

    if (actualLoc.x < width/2) {
      magBlowX = -0.5 *  mag(baseBlow.x, actualLoc.x);
    }
    else {
      magBlowX = 0.5* mag(baseBlow.x, actualLoc.x);
    }
    float magBlowY = mag(baseBlow.y, actualLoc.y);


    float forceY = map( movers_.location.y, 0, height, 0, 2);
    float forceX = map( magBlowX, 0, height, 0, 2);
    if (forceY >= 0) {
      PVector direction = new PVector(0, forceY*-1);
      movers_.applyForce(direction);
    }
  }
}

void mouseClicked() {

  //  cursor.clicked(movers);
  blow();
}

void keyPressed(){
 if(key=='s'){
  saveFrame("../img/"+frameCount+"omarBlow.png");
 } 
}


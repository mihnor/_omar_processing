// todo
// Resolver o bug do atrito

/* @pjs preload="pequenosreparos.jpg"; */
/* @pjs preload="edge.jpg"; */

PVector baseBlow;
PImage fundo; 
PImage edgeImage;

Finger cursor;
JSONArray jsonMovers;

ArrayList<Mover> movers;

void setup() {
  size(525, 700);
  //  background(255);

  cursor = new Finger(30);
  movers = new ArrayList<Mover>();

  fundo = loadImage("pequenosreparos.jpg");

  image(fundo, 0, 0);
  tint(255, 20);
  createDots("edge.jpg");
  //  getJson();
  noSmooth();
  baseBlow = new PVector(width/2, height);
}


void getJson() {
  // jsonMovers = new JSONArray(movers);
}



void draw() {
  cursor.radius = 10;

  //  fill(255,20);
  //  rect(0,0,width,height);

  //  cursor.display();


  for (int i = 0; i < movers.size(); i++) {

    //    Mover movers_ = movers.get(i);
    //    movers_.display();

//    friction(movers.get(i));
//
//    movers.get(i).update();
//    movers.get(i).display();
//    movers.get(i).checkEdges();
    

    movers.get(i).displayDrag();
    cursor.update();
  }
}

//void mousePressed() {
////  blow();
//}


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

void mousePressed() {

//  blow();
  cursor.clicked(movers);
  
}

void mouseDragged() {

  cursor.drag();
}

void mouseReleased() {

  cursor.moverIds.clear();
}

void keyPressed() {
  if (key=='s') {
    saveFrame("img/"+frameCount+"omar.png");
  }
}


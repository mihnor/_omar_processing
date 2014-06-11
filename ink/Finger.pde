

class Finger {

  
  ArrayList moverIds;
  float radius;
  PVector pos;
  boolean hide;

  Finger(float radius_) {

    this.radius = radius_;
    pos = new PVector(mouseX, mouseY);
    moverIds = new ArrayList();
  };

  void clicked(ArrayList<Mover> mvs) {
    
    for (int i =0; i < mvs.size(); i++){
      
      Mover m = mvs.get(i);
      if(m.checkFinger(this)){
       moverIds.add(i); 
      }
      
    }
     println(moverIds);
  }
  
  void update(){
    
    pos.set(mouseX, mouseY);
    
  }

  void display() {
    fill(255, 100);
    ellipse(pos.x, pos.y, radius, radius);
  };
}




class Finger {

  
  IntList moverIds;
  float radius;
  PVector pos;
  boolean hide;

  Finger(float radius_) {

    this.radius = radius_;
    pos = new PVector(mouseX, mouseY);
    moverIds = new IntList();
  };

  void clicked(ArrayList<Mover> mvs) {
    
    for (int i =0; i < mvs.size(); i++){
      
      Mover m = mvs.get(i);
      if(m.checkFinger(this)){
       moverIds.append(i); 
      }
      
    }
     println(moverIds);
  }
  
  void drag(){
 

    
    for(int i = 0 ; i < moverIds.size(); i++){
     
       int id = int(this.moverIds.get(i));
       
       movers.get(id).updateDrag(mouseX - pmouseX, mouseY - pmouseY);
      
    }
    
  };
  
  void update(){
    
    pos.set(mouseX, mouseY);
    
  }

  void display() {
    fill(255, 100);
    ellipse(pos.x, pos.y, radius, radius);
  };
}


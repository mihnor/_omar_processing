void friction(Mover m) {

  float c = 0.04;
  PVector friction = m.velocity.get();
//  c = map(friction.y, 0, 6, 1, 0);

  friction.mult(-1);
  friction.normalize();
  friction.mult(c);
//  println(c);
  //Apply the friction force vector to the object.
  m.applyForce(friction);

}


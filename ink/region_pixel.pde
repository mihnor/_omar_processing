void createDots(String fileName_) {
  edgeImage = loadImage(fileName_);
  int dimension = edgeImage.width * edgeImage.height;
  edgeImage.loadPixels();
  float threshold = 200;

  for (int ix = 0; ix < edgeImage.width; ix++) {
    for (int iy = 0; iy < edgeImage.height; iy++) {
      float col = brightness(edgeImage.pixels[ix + iy * edgeImage.width]);
      //If the brightness is less than the threshold on an gray scale (to include dark gray)
      if (col > threshold) {
        //Add the X and Y coordinates to the list
        
        
        movers.add(new Mover(random(0.1,2), ix, iy));
          
    }
    }
  }
}


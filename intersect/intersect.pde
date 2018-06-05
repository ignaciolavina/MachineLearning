
Punto A;
Punto B;
Punto C;
Punto D;

void setup(){
     size(800, 600);     
     background(255);
    
    A = new Punto(450, 100);
    B = new Punto(600, 300);
    
    C = new Punto(50, 500);
    D = new Punto(500, 100);
    
  }
  
void draw(){
    
  background(255);
  line (A.x, A.y, B.x, B.y);
  line (C.x, C.y, D.x, D.y);
   boolean ret;
   ret = linesTouching(A.x, A.y, B.x, B.y, C.x, C.y, D.x, D.y);
   if(ret){
     lineIntersection(A.x, A.y, B.x, B.y, C.x, C.y, D.x, D.y);
   }
    print(ret);
       
  }
  
boolean linesTouching(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float denominator = ((x2 - x1) * (y4 - y3)) - ((y2 - y1) * (x4 - x3));
  float numerator1 = ((y1 - y3) * (x4 - x3)) - ((x1 - x3) * (y4 - y3));
  float numerator2 = ((y1 - y3) * (x2 - x1)) - ((x1 - x3) * (y2 - y1));

  // Detect coincident lines (has a problem, read below)
  if (denominator == 0) return numerator1 == 0 && numerator2 == 0;

  float r = numerator1 / denominator;
  float s = numerator2 / denominator;
  
  return (r >= 0 && r <= 1) && (s >= 0 && s <= 1);
}

PVector lineIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  
  // calculate the distance to intersection point
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  // if uA and uB are between 0-1, lines are colliding
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    ellipse(x1 + (uA * (x2-x1)), y1 + (uA * (y2-y1)), 5, 5);
    return new PVector(x1 + (uA * (x2-x1)), y1 + (uA * (y2-y1)));
  }
  return null;
}



/* Controller to switch between the different screens. It changes the GameState and draw() function is launched automatically */   
void keyPressed(){   
  
    if(key == CODED){
      switch(keyCode){
        case LEFT:
          C.x -= 10;
          D.x -=10;
          break;
        case RIGHT:
          C.x += 10;
          D.x +=10;
          break;    
      }
      }
}

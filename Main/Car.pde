class Car{
  
  public PImage image;
  int x;
  int y;
  int alto = 50;
  int ancho = 120;
  boolean crashed = false;
  
  int start_x = 50;
  int start_y = 200;
  
  public Car(){
    image = loadImage("./Assets/Car2.png");
    image.resize(ancho, alto);

      x = start_x;
      y = start_y;    
  }
  
  
  public void draw(){
    if (crashed){      
      image (image, x, y);
    }
    rect(x, y, ancho, alto);
    fill(0);
    
    line(x, y+ (alto/2), x+300, y + (alto/2));
  }
  
  public void moveLeft(){
    x = x - 10;
  }
  
  public void moveRight(){
    x = x + 10;
  }
  
  public int[] params(){
     int [] i = {x, y, ancho, alto};
     return i;
  }
  
  public void choque(){
    crashed = true;
    image = loadImage("./Assets/crash.png");
  }
  
  public void reset(){    
    crashed = false;
    x = start_x;;
    y = start_y;
  }
}

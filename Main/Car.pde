class Car{
  
  public PImage image;
  int x;
  int y;
  int alto = 50;
  int ancho = 120;
  boolean crashed = false;
  
  int start_x = 100;
  int start_y = 300;
  
  int SENS_LONG = 200;
  int sensor = 200;
  
  public Car(){
    image = loadImage("./Assets/Car.png");

    image.resize(ancho, alto);
    

      x = start_x;
      y = start_y;    
  }
  
  public int getSensor(){
    return sensor; 
  }
  
  
  public void draw(){
    imageMode(CENTER);
    if (crashed){      
      image (image, x, y);
    }
    image (image, x, y);
    fill(20);
    rectMode(CENTER);
    rect(x, y, ancho, alto);
    fill(0);
    //line(x, y, x+ ancho +SENS_LONG, y + (alto/2));
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
    sensor = SENS_LONG;
    crashed = false;
    x = start_x;;
    y = start_y;
  }
  
  public void moveLeft(){
    x = x - 10;
  }
  
  public void moveRight(){
    x = x + 10;
  }
  
  public void moveUp(){
    y = y - 10;
  }
  
  public void moveDown(){
    y = y + 10;
  }
}

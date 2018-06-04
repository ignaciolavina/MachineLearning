class Car{
  
  public PImage image;
  int x;
  int y;
  int alto = 50;
  int ancho = 120;
  boolean crashed = false;
  
  int VEL;
  
  int start_x = 100;
  int start_y = 300;
  
  
  Sensor sens;
  
  public Car(){
    VEL = Main.VEL;
    
    image = loadImage("./Assets/Car.png");
    image.resize(ancho, alto);    

      x = start_x;
      y = start_y;
      
      sens = new Sensor(x, y);
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
    sens.draw();
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
    sens.reset(x, y);
  }
  
  public void moveLeft(){
    sens.udpdateLeft(VEL);
    x = x - VEL;
  }
  
  public void moveRight(){
    sens.udpdateRight(VEL);
    x = x + VEL;    
  }
  
  public void moveUp(){
    sens.udpdateUp(VEL);
    y = y - VEL;
  }
  
  public void moveDown(){
    sens.udpdateDown(VEL);
    y = y + VEL;
  }
}

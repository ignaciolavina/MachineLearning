class Obstacle{
  
  public PImage image;
  int x;
  int y;
  int alto = 50;
  int ancho = 120; 
  
  int start_x = 500;
  int start_y = 200;
  
  
  public Obstacle(){
    x= start_x;
    y = start_y;
    //rect(30, 20, 55, 55);
    color c;  // Declare color 'c'
    //noStroke();  // Don't draw a stroke around shapes
    colorMode(HSB, 100);  // Use HSB with scale of 0-100
    c = color(50, 55, 100);  // Update 'c' with new color
    fill(c);  // Use updated 'c' as fill color
  } 
  
  public void draw(){
    fill(20);
    rect(x, y, 55, 300);    
  }
  
    public int[] params(){
     int [] i = {x, y, ancho, alto};
     return i;
  }
  
}

class Obstacle{
  
  public PImage image;
  int x;
  int y;
  int alto = 50;
  int ancho = 120; 
  
  public Obstacle(){
    x= 500;
    y = 100;
    //rect(30, 20, 55, 55);
    color c;  // Declare color 'c'
    //noStroke();  // Don't draw a stroke around shapes
    colorMode(HSB, 100);  // Use HSB with scale of 0-100
    c = color(50, 55, 100);  // Update 'c' with new color
    fill(c);  // Use updated 'c' as fill color
  } 
  
  public void draw(){
    rect(x, y, 55, 300);    
  }
  
    public int[] params(){
     int [] i = {x, y, ancho, alto};
     return i;
  }
  
}

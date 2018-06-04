class Sensor{
  
  int x, y;
  int [] fin = new int [2];
  
  int VEL;
  
  int DISTANCE = 200;
  float angulo = -4;
  
  int x2;
  int y2;
   color c;  // Declare color 'c'

  
  float resultado = DISTANCE;
  
 public Sensor(int x, int y){
   VEL = Main.VEL;
   this.x = x;
   this.y = y;
   x2 = x + DISTANCE;
   y2 = y + 20;
   
       //noStroke();  // Don't draw a stroke around shapes
    colorMode(HSB, 100);  // Use HSB with scale of 0-100
    c = color(50, 55, 100);
   //print("x: "+x+ " sin: " + (y + sin(angulo)*DISTANCE) + " y: "+ y+ " cos: " + ( x + cos(angulo)*DISTANCE));16735512  16735512
 }
 
 public void medir(){
   //print("x: " + x2 + ", " + y2 + " color " + get(x2, y2));
   if (get(x2+2, y2) == get(x +2, y+2)){
    text("eafdfda", 50, 200);
    x2 = x2 - 5;
   }else{
     if(x2 < x+ DISTANCE)
       x2 = x2 + 5;
   }
 }
 
 public void draw(){
   
   line(x, y, x2, y2);
   medir();
   fill(get(x2+2, y2));

   ellipse(x2, y2, 5, 5);
   fill(20);
   text("x: " + x + " y: " + y, 50, 100);
   text("x2: " + x2 + " y2: " + y2, 50, 150);
   
   
   //dibujar tmb la barrita representación
   
 }
 
 public void udpdateRight(int VEL){
   x = x + VEL;
   x2 = x2 + VEL;
 }
 
  public void udpdateLeft(int VEL){
   x = x - VEL;
   x2 = x2 - VEL;
 }
  public void udpdateUp(int VEL){
   y = y - VEL;
   y2 = y2 - VEL;
 }
   public void udpdateDown(int VEL){
   y = y + VEL;
   y2 = y2 + VEL;
 }
 
 public void reset(int x, int y){
   this.x = x;
   this.y = y;
   x2 = x + DISTANCE;
   y2 = y;
 }
}

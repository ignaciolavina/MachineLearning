/*
  IA Machine Learning tryout
*/


public enum GameState {WELCOME, RESTART, GAME};  // Different states of the game
GameState gameState = GameState.WELCOME;
public PImage background_img; //
Car car;
Obstacle obs1;

ArrayList<Obstacle> obstaculos = new ArrayList<Obstacle>();

void setup(){
     size(800, 600);     
     background(255);
     
     //Creamos el coche
     car = new Car();
     background_img = loadImage("./Assets/Background2.png");
     background_img.resize(800,600);
     
     obs1 = new Obstacle();
     obstaculos.add(obs1);
     
     gameState = GameState.GAME;

      
}

void draw(){
  
  switch (gameState){
   case WELCOME:
   
   break;
   case RESTART:
   break;
   
   case GAME:
     imageMode(CORNER);
     image(background_img, 0, 0);
     
    imageMode(CENTER);
     car.draw();
     obs1.draw();
     text("sensor: " + car.sensor, 20, 20);
     
     check_colision();
   
   break;
  }
}
  int [] params_a = new int [4];
  int [] params_b = new int [4];
  public void check_colision(){
   for (int i = 0; i < obstaculos.size(); i++){
     //funcion (obj1, obj2);
     params_a = car.params();
     params_b = obstaculos.get(i).params();
     line(params_a[0], params_a[1], params_b[0], params_b[1]);
     //comprobamos colision
     /*
     if ((params_a[0] + params_a[2]) >= params_b[0]){
       car.choque();
     }
     if ((params_a[0] + params_a[2]) >= params_b[0]){
       car.choque();
     }
     */
     ellipse((params_b[0] - params_b[2]/2), params_b[1], 5, 5);
     //(((params_b[0] - params_b[2]/2) - (params_a[0] + params_a[2]/2)) <= 0) && 
     //(((params_b[1] - params_b[3]/2) - (params_a[1] + params_a[3]/2)) <= 0)
     if ( (((params_b[0] - params_b[2]/2) - (params_a[0] + params_a[2]/2)) <= 0)  && ( ((params_a[0] - params_a[2]/2) - (params_b[0] + params_b[2]/2)) <=0 )) {
       

       car.choque();
     }else{
       car.image = loadImage("./Assets/Car.png");
       
     }
   }
    
  }
  
  
/* Controller to switch between the different screens. It changes the GameState and draw() function is launched automatically */   
void keyPressed(){   
  
  if (gameState == gameState.GAME){
    if(key == CODED){
      switch(keyCode){
        case LEFT:
          car.moveLeft();
          break;
        case RIGHT:
          car.moveRight();
          break;      
        case UP:
          car.moveUp();
          break;
        case DOWN:
          car.moveDown();
          break;
      }
    }
    if(key == ENTER){
      car.reset();
    }
  }
}

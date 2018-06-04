/*
  IA Machine Learning tryout
*/


public enum GameState {WELCOME, RESTART, GAME};  // Different states of the game
GameState gameState = GameState.WELCOME;
public PImage background_img; //
Car car;
Obstacle obs1;
static int VEL = 10;

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
    
     obs1.draw();
     car.draw();
     text("sensor: " + car.sens, 20, 20);
     
     check_colision();
   
   break;
  }
}


  
  public void check_colision(){

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

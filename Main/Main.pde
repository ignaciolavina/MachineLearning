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
     
     image(background_img, 0, 0);
     car.draw();
     obs1.draw();
     
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
     //comprobamos colision
     if ((params_a[0] + params_a[2]) >= params_b[0]){
       car.choque();
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
      }
    }
    if(key == ENTER){
      car.reset();
    }
  }
}

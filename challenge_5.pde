// Jerome Martinez
// Challenge 5: Algorithms

// global variables
int NUM_SCENES = 6;
int SCENE_COUNTER = 0;

// the list that contains all the scenes
Scene[] SCENES_LIST = new Scene[NUM_SCENES]; 

void setup() {
  size(800, 800);
  noStroke();
  
  // initalize the SCENE_LIST array
  for (int s = 0; s < NUM_SCENES; s++) {    
    // create a white background for the title scene
    if (s == 0) {
      color startSceneColor = color(255, 255, 255);
      int numberActors = 0;
      SCENES_LIST[s] = new Scene(startSceneColor, numberActors); 
    }
    
    // create a black background for the finishing scene
    else if (s == NUM_SCENES-1) {
      color finSceneColor = color(0, 0, 0);
      int numberActors = 0;
      SCENES_LIST[s] = new Scene(finSceneColor, numberActors); 
    }
    
    // create a new scene for the rest
    else {
      int numberActors = 2;
      int randomR = int(random(100, 150));
      int randomG = int(random(100, 150));
      int randomB = int(random(100, 150));
      color sceneColor = color(randomR, randomG, randomB);
      SCENES_LIST[s] = new Scene(sceneColor, numberActors);
    }
  }
}

void draw() {
  // get the current scene
  Scene currentScene = SCENES_LIST[SCENE_COUNTER];
  // display the current scene
  currentScene.displayScene();
}

// increase the SCENE_COUNTER by pressing the space bar
void keyPressed() {
  if (key == ' ') {
    SCENE_COUNTER++;
    if (SCENE_COUNTER > NUM_SCENES-1) {
      exit(); 
    }
  }
}

// this class represents on section of the story
class Scene {
  color backgroundColor;
  int numActors;
  Actor[] actors;

  Scene (color bgColor, int nActors) {
    // initialize the actor list
    this.numActors = nActors;
    actors = new Actor[this.numActors];
    if (this.numActors > 0) {
      this.castActors();
    }
    
    // set the background scene color
    this.backgroundColor = bgColor;
  }
  
  // class function to intialize all the actors
  void castActors() { 
    for (int a = 0; a < this.numActors; a++)  {
      
      // first actor is the main character
      if (a == 0) {
        // set the main actor's color and size
        int mainActorSize = 200;
        color mainActorColor = color(255, 0, 0);
        this.actors[a] = new Actor(mainActorColor, mainActorSize);
        
      // everyone else is a minor character
      } else {
        // create random color values and size for minor characters
        int randomR = int(random(150, 200));
        int randomG = int(random(150, 200));
        int randomB = int(random(150, 200));
        color minorActorColor = color(randomR, randomG, randomB);
        int minorActorSize = int(random(50, 70));
        this.actors[a] = new Actor(minorActorColor, minorActorSize);
      }
    } 
  }
  
  // main function for displaying the scene
  void displayScene() {
    // display the scene's background color
    background(this.backgroundColor);
    
    // display the actors for this scene
    for(int a = 0; a < this.numActors; a++) {
      Actor thisActor = this.actors[a];
      thisActor.displayActor();
    }
  }
}

class Actor {
  color fillColor;
  int actorSize;
  int posX, posY;
  
  Actor(color fColor, int aSize) {
    // set the actor's fill color and size
    this.fillColor = fColor;
    this.actorSize = aSize;
    
    // create random positional values for the actor's location
    int randomX = int(random(this.actorSize, width-this.actorSize));
    int randomY = int(random((height/2)-(this.actorSize), (height/2)+(this.actorSize)));
    println((height/2)-(this.actorSize));
    this.posX = randomX;
    this.posY = randomY;
  }
   
  void displayActor() {
    fill(this.fillColor);
    ellipse(this.posX, this.posY, this.actorSize, this.actorSize);
  }
  
}
// Jerome Martinez
// Challenge 5: Algorithms

// global variables
int NUM_SCENES = 15;
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
      color sceneColor = color(255, 255, 255);
      int numberActors = 0;
      SCENES_LIST[s] = new Scene(sceneColor, numberActors); 
    }
    
    // create a black background for the finishing scene
    else if (s == NUM_SCENES-1) {
      color sceneColor = color(0, 0, 0);
      int numberActors = 0;
      SCENES_LIST[s] = new Scene(sceneColor, numberActors); 
    }
    
    // create a new scene for the rest
    else {
      int numberActors = 4;
      SCENES_LIST[s] = new Scene(numberActors);
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
  
  Scene (int nActors) {
    
    // initialize the actor list
    this.numActors = nActors;
    actors = new Actor[this.numActors];
    if (this.numActors > 0) {
      this.initalizeActors();
    }
    
    // initialize the scene background color
    int randomR = int(random(100, 150));
    int randomG = int(random(100, 150));
    int randomB = int(random(100, 150));
    this.backgroundColor = color(randomR, randomG, randomB);
  }

  Scene (color bgColor, int nActors) {
    
    // initialize the actor list
    this.numActors = nActors;
    actors = new Actor[this.numActors];
    if (this.numActors > 0) {
      this.initalizeActors();
    }
    
    // set the background scene color
    this.backgroundColor = bgColor;
  }
  
  // class function to intialize all the actors
  void initalizeActors() { 
    for (int a = 0; a < this.numActors; a++)  {
      if (a == 0) {
        this.actors[a] = new Actor(color(255, 0, 0), 200);
      } else {
        this.actors[a] = new Actor();
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
  
  // first constructor
  Actor () {
    // create random color values for the actor's color
    int randomR = int(random(150, 200));
    int randomG = int(random(150, 200));
    int randomB = int(random(150, 200));
    this.fillColor = color(randomR, randomG, randomB);
    
    // create random positional values for the actor's location
    int randomX = int(random(this.actorSize, width-this.actorSize));
    int randomY = int(random(this.actorSize, height-this.actorSize));
    this.posX = randomX;
    this.posY = randomY;
    
    // make the actor a random size
    this.actorSize = int(random(50, 70));
  }
  
  // second constructor
  Actor(color fColor, int aSize) {
    
    // create random positional values for the actor's location
    int randomX = int(random(this.actorSize, width-this.actorSize));
    int randomY = int(random(this.actorSize, height-this.actorSize));
    this.posX = randomX;
    this.posY = randomY;
    
    // set the actor's fill color and size
    this.fillColor = fColor;
    this.actorSize = aSize;
  }
  
  void displayActor() {
    fill(this.fillColor);
    ellipse(this.posX, this.posY, this.actorSize, this.actorSize);
  }
  
}
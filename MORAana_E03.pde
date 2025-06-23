//La intencion de mi codigo es mostrar las burbujas con un comportamiento como el de un semaforo
//Se mueven con diferentes velocidades teniendo en cuenta el significado que se les da en un semaforo
//Rojo es quieto, naranja lento y verde rapido


//variables
int numBubbles = 20;

float[] xPositions;
float[] yPositions;

float[] xSpeeds;
float[] ySpeeds;

int[] xDirections;
int[] yDirections;

//Configuracion del entorno y generalidades
void setup() {
  size(500, 500);
  noStroke();
  colorMode(HSB, 360, 100, 100); 

  xPositions = new float[numBubbles];
  yPositions = new float[numBubbles];
  xSpeeds = new float[numBubbles];
  ySpeeds = new float[numBubbles];
  xDirections = new int[numBubbles];
  yDirections = new int[numBubbles];

  for (int i = 0; i < numBubbles; i++) {
    xPositions[i] = random(width);
    yPositions[i] = random(height);

    
    float tipo = random(1); 

    if (tipo < 0.33) {
      xSpeeds[i] = 0;
      ySpeeds[i] = 0;
    } else if (tipo < 0.66) {
      xSpeeds[i] = 1;
      ySpeeds[i] = 1;
    } else {
      xSpeeds[i] = 3;
      ySpeeds[i] = 3;
    }

    xDirections[i] = (random(1) > 0.5) ? 1 : -1;
    yDirections[i] = (random(1) > 0.5) ? 1 : -1;
  }
}

//Configuracion del comportamiento dentro del canvas
void draw() {
  background(0); 

  for (int i = 0; i < numBubbles; i++) {
    xPositions[i] += xSpeeds[i] * xDirections[i];
    yPositions[i] += ySpeeds[i] * yDirections[i];

    
    if (xPositions[i] >= width || xPositions[i] < 0) xDirections[i] *= -1;
    if (yPositions[i] >= height || yPositions[i] < 0) yDirections[i] *= -1;

    if (xSpeeds[i] == 0) {
      fill(0, 100, 100);
    } else if (xSpeeds[i] == 1) {
      fill(30, 100, 100); 
    } else {
      fill(120, 100, 100); 
    }

    ellipse(xPositions[i], yPositions[i], 50, 50);
  }
}

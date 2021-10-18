PVector[] pointsArray = new PVector[8];//Points of the cube
float angle = 0;//Angle of the rotation

float[][] projectionMatrix = {
  {1, 0, 0}, 
  {0, 1, 0}
};


void settings()
{
  size(600, 400);
}

void setup()
{  
  int sizeOfCube=50;//Define the size of the cube

  pointsArray[0]= new PVector(sizeOfCube, sizeOfCube, sizeOfCube);
  pointsArray[1]= new PVector(sizeOfCube, -sizeOfCube, sizeOfCube);
  pointsArray[2]= new PVector(-sizeOfCube, -sizeOfCube, sizeOfCube);
  pointsArray[3]= new PVector(-sizeOfCube, sizeOfCube, sizeOfCube);

  pointsArray[4]= new PVector(sizeOfCube, sizeOfCube, -sizeOfCube);
  pointsArray[5]= new PVector(sizeOfCube, -sizeOfCube, -sizeOfCube);
  pointsArray[6]= new PVector(-sizeOfCube, -sizeOfCube, -sizeOfCube);
  pointsArray[7]= new PVector(-sizeOfCube, sizeOfCube, -sizeOfCube);
}

void draw()
{
  background(0);//Define the color of the background
  stroke(255);//Define the color of the draw lines and points
  strokeWeight(10);//define the size of the drawn lines and points
  translate(width/2, height/2);//Define the coordonate (0,0) as the center of the display window

  float[][] rotationMatrixInX = {
    {1, 0, 0}, 
    {0, cos(angle), -sin(angle)}, 
    {0, sin(angle), cos(angle)}
  };

  float[][] rotationMatrixInY = {
    {cos(angle), 0, sin(angle)}, 
    {0, 1, 0}, 
    {-sin(angle), 0, cos(angle)}
  };

  float[][] rotationMatrixInZ = {
    {cos(angle), -sin(angle), 0}, 
    {sin(angle), cos(angle), 0}, 
    {0, 0, 1}
  };


  for (PVector point : pointsArray)
  {
    //-----------MATRIX ROTATION :--------------//
    PVector pointRotated;
    pointRotated = matrixMultiplication(rotationMatrixInX, point);
    pointRotated = matrixMultiplication(rotationMatrixInY, pointRotated);
    pointRotated = matrixMultiplication(rotationMatrixInZ, pointRotated);


    //-----------MATRIX PROJECTION :------------//
    //SIMPLE WAY (CHEATING) :
    //point(point.x, point.y);
    //OR
    //HARD WAY (MATHS):
    PVector pointProjected = matrixMultiplication(projectionMatrix, pointRotated);


    //-----------POINT DRAWING :---------------//
    point(pointProjected.x, pointProjected.y);
  }
  
  angle+=0.03;//Angle rotation incrementation
  
  if (angle>PI*2)
    angle=0;
}

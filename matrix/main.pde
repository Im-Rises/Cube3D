PVector[] pointsArray = new PVector[8];//Points of the cube
float angle = 0;//Angle of the rotation

//Projection matrix
float[][] projectionMatrix = {
  {1, 0, 0}, 
  {0, 1, 0}
};


void settings()
{
  size(600, 400);//Screen size initialisation
}

void setup()
{  
  int sizeOfCube=50;//Define the size of the cube

  //-----------POINTS SETUP :--------------//
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
  //-----------SCREEN INITIALISATION :--------------//
  background(0);//Define the color of the background
  stroke(255);//Define the color of the draw lines and points
  strokeWeight(6);//define the size of the drawn lines and points
  translate(width/2, height/2);//Define the coordonate (0,0) as the center of the display window

//-----------ROTATION MATRICES :--------------//
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

  
  PVector[] indexPVectorLine = new PVector[8];//Temporaire PVector to draw lines
  int i=0;
  
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

    indexPVectorLine[i]=pointProjected;
    i++;
  }

  //-----------POINTS CONNECTION :---------------//
  strokeWeight(2);//define the size of the drawn lines and points
  pointConnection(indexPVectorLine,0,1);
  pointConnection(indexPVectorLine,1,2);
  pointConnection(indexPVectorLine,2,3);
  pointConnection(indexPVectorLine,3,0);
  
  pointConnection(indexPVectorLine,4,5);
  pointConnection(indexPVectorLine,5,6);
  pointConnection(indexPVectorLine,6,7);
  pointConnection(indexPVectorLine,7,4);

  pointConnection(indexPVectorLine,1,5);
  pointConnection(indexPVectorLine,2,6);
  pointConnection(indexPVectorLine,3,7);
  pointConnection(indexPVectorLine,4,0);


  //-----------ANGLE ROTATION :---------------//
  angle+=0.03;//Angle rotation incrementation

  if (angle>PI*2)
    angle=0;
}


public void pointConnection(PVector[] indexPVectorLine,int point1Index, int point2Index)
{
    line(indexPVectorLine[point1Index].x, indexPVectorLine[point1Index].y, indexPVectorLine[point2Index].x, indexPVectorLine[point2Index].y);
}

/*--------------------------------MATRIX MULTIPLICATION FUNCTIONS-----------------------------*/

float[][] matrixMultiplication(float[][] matrix1, float[][] matrix2)
{
  int matrix1Row = matrix1.length;
  int matrix1Column = matrix1[0].length;
  int matrix2Row = matrix2.length;
  int matrix2Column = matrix2[0].length;

  if (matrix1Column != matrix2Row)
  {
    println("Error in matrix multiplication, matrix 1 column must match matrix 2 row.");
    return null;
  } else
  {
    float[][] result = new float[matrix1Row][matrix2Column]; 

    for (int i =0; i <matrix1Row; i++)
    {
      for (int j =0; j <matrix2Column; j++)
      {
        float calcValue=0;
        for (int k =0; k < matrix1Column; k++)
        {
          calcValue+=matrix1[i][k]*matrix2[k][j];
        }
        result[i][j]=calcValue;
      }
    }
    return result;
  }
}



PVector matrixMultiplication(float[][] matrix1, PVector point)
{
  float[][] pointConvertedInMatrix = pointPvectorToMatrix(point);
  return matrixToPointPvector(matrixMultiplication(matrix1, pointConvertedInMatrix));
}


/*--------------------------------MATRIX PRINT FUNCTIONS-----------------------------*/

void printMatrix(float[][] matrix)
{
  int matrixRow = matrix.length;
  int matrixColumn = matrix[0].length;

  println("Matrix of size ("+matrixRow+"x"+matrixColumn+") :");

  for (int i =0; i <matrixRow; i++)
  {
    for (int j = 0; j<matrixColumn; j++)
    {
      print(matrix[i][j]+"  ");
    }
    println();
  }
}

void printMatrix(PVector matrix)
{
  printMatrix(pointPvectorToMatrix(matrix));
}


/*--------------------------------CONVERSION FUNCTIONS-----------------------------*/

float[][] pointPvectorToMatrix(PVector pvector)
{
  float[][] matrix = new float[3][1];
  matrix[0][0]=pvector.x;
  matrix[1][0]=pvector.y;
  matrix[2][0]=pvector.z;

  return matrix;
}

PVector matrixToPointPvector(float[][] matrix)
{
  if (matrix.length>2)
    return (new PVector(matrix[0][0], matrix[1][0], matrix[2][0]));
  else
    return (new PVector(matrix[0][0], matrix[1][0]));
}

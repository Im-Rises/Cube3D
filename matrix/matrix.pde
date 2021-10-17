float[][] projection = {
  {1, 0, 0}, 
  {0, 1, 0}
};

float[][] point = {
  {1}, 
  {1}, 
  {1}
};

//FAUX, revoir cette fonction :
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
    float[][] result = new float[matrix2Row][matrix1Column]; 

    for (int i =0; i <matrix1Row; i++)
    {
      for (int j =0; j <matrix2Column; j++)
      {
        float calcValue=0;
        for (int k =0; k < matrix2Column; k++)
        {
          calcValue+=matrix1[k][i]*matrix2[j][k];
        }
        result[j][i]=calcValue;
      }
    }
    return result;
  }
}

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

void setup()
{
  printMatrix(projection);
  printMatrix(point);
  float[][] result = matrixMultiplication(projection, point);
  printMatrix(result);
}

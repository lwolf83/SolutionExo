using System;

class MainClass {
  public static void Main (string[] args) {

    int[,] tab1 = new int[3,3] { { 1, 2, 3 }, { 2, 3, 4 }, { 3, 4, 5}};
    int[][] res = new int[3][];

    for(int i = 0; i < 3; i++)
    {
      res[i] = new int[3-i];
      Console.WriteLine("res["+ i+"] ");
      for(int j = i; j < 3; j++)
      {
        Console.WriteLine("res[" + i + "][" + (j-i) + "] = " + tab1[i,j]);
        res[i][(j-i)] = tab1[i,j];
      }
    }
  }
}

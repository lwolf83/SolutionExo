using System;

class MainClass {
  public static void Main (string[] args) {

    int[] tab1 = {1,2,3};
    int[] tab2 = new int[3];
    int[] tab3 = new int[6];

    for(int i = 0; i< 3; i++)
    {
      tab3[i] = tab1[i];
      tab3[i+3] = tab2[i];
    }


  }
}

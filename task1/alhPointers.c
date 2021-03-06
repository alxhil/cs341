#include <stdio.h>
//Author: Alex Hill //
//Homework #0 Task B//
//Date: 8/23/19     //
//Course: CS-341    //
void bubbleSort(int array[], int size);
int main() {
  //Array given from Homework File //
  int unsorted[] = {4, 3, 7, 8, 11, 18, 2, 21, 45, 1, 101, 100, 87, 16};
  //Gets size of array using sizeof//
  //Need to cast int to convert from bits to an integer//
  int arraySize = (int)(sizeof(unsorted)/sizeof(unsorted[0]));
  printf("Array size: %d\n", arraySize);
  bubbleSort(unsorted,arraySize);
  return 0;
}

//Bubble sort algorithm                             //
//Goes through array size - 1 iterations of swapping//

void bubbleSort(int array[], int arraySize){
  int temp;
  for(int n = arraySize; n > -1; n--)
    {
      for(int i = -1; i < n; i++)
	{
	  if(array[i] > array[i+1]){
	    temp = array[i];
	    array[i] = array[i+1];
	    array[i+1] = temp;
	  }
	}
    }
  //Making the array output readable//
  printf("{");
  for(int z = 0; z < arraySize; z++)
    {
      printf("%d",array[z]);
      if(z < arraySize-1)
	{
	  printf(", ");
      }
    }
  printf("}\n");
}


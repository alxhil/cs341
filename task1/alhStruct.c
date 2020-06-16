#include <stdio.h>
#include <math.h>

//Author: Alex Hill  //
//Homework #0 Task A //
//Date: 8/20/19      //
//Course: CS-341     //

/*
  Distance function, uses the widely know distance formula
  to calculate the distance between two coordinates in a 2d space
  Formula: sqrt(((x2-x1)^2)+(y2-y1)^2)
 */
void distance(int x1, int x2, int y1, int y2);


/*
  Coordinate structure
  Used for defining a coordinate that has a x-value
  and a y-value.
 */
struct coord {
  int x;
  int y;
};


int main(){
  struct coord c1;
  struct coord c2;

  /*
    Taking input from terminal to get the coordinates required
    for the distance formula
   */

  printf("Enter x1:");
  scanf("%d", &c1.x);
  printf("Enter y1:");
  scanf("%d", &c1.y);
  printf("Enter x2:");
  scanf("%d", &c2.x);
  printf("Enter y2:");
  scanf("%d", &c2.y);
  
  
  distance(c1.x,c2.x,c1.y,c2.y);
  return 0;
}

void distance(int x1, int x2, int y1, int y2){

  int num1 = (x2 - x1);
  int num2 = (y2 - y1);
  double formula = sqrt((num1*num1)+(num2*num2));
  printf("\nThere is a distance of %f units between the two coordinates\n",formula);
  
}

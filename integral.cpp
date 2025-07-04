#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
                                                                                                                                                                                            
int count;
float total, inBox;
                                                                                                                                                                                            
float f (float x){
  return exp(cos(x));
}                                                                                                                                                                                           
                                                                                                                                                                                            
float integral (float (*f)(float), float xmin, float xmax, float ymin, float ymax){
  for (count=0; count < 1000000; count++){
    float u1 = (float)rand()/(float)RAND_MAX;
    float u2 = (float)rand()/(float)RAND_MAX;
    float xcoord = ((xmax - xmin)*u1) + xmin;
    float ycoord = ((ymax - ymin)*u2) + ymin;
    float val = f(xcoord);
    total++;                                                                                                                                                                                
    if (val > ycoord){
      inBox++;                                                                                                                                                                              
    }                                                                                                                                                                                       
  }                                                                                                                                                                                         
  float density = inBox/total;
  std::cout<<(xmax - xmin)*(ymax - ymin)*density<<std::endl;                                                                                                                                
}                                                                                                                                                                                           
                                                                                                                                                                                            
int main(int argc, char* argv[]) {
    if (argc != 5) {
        std::cerr << "Usage: " << argv[0] << " xmin xmax ymin ymax\n";
        return 1;
    }                                                                                                                                                                                       
    float xmin = atof(argv[1]);
    float xmax = atof(argv[2]);
    float ymin = atof(argv[3]);
    float ymax = atof(argv[4]);
    std::cout << "RESULT: " << integral(f, xmin, xmax, ymin, ymax) <<
        std::endl;                                                                                                                                                                          
    return 0;
}          

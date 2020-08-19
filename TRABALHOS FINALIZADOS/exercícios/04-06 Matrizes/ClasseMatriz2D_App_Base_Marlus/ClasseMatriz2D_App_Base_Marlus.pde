Matriz2D matriz1, matriz2, matriz3, matriz4, matriz5;
float[][] d = { { 2, -2, -1 }, { 3, -4, 1 }, { 1, 1, 5} };
float[][] a = {{2, -2, -1}, {3, -4, 1}, {1, 1, 5}}; //det A = -21
float[][] b = {{1, 2, 3, 4, 5},
               {-1, 0, 8, 5, 9},
               {2, 2, 3, 5, 7},
               {-3, -1, 12, 0, 7},
               {1, -1, 1, 3, 13}}; //det F = -710
float[][] c = {{1, 0, 5, 0},
               {2, -1, 0, 3},
               {3, 0, 2, 0},
               {7, 0, 6, 5}}; //det E = 65           
void setup (){ 
  size(610,500);   noLoop();
  matriz1 = new Matriz2D(3,3);
  matriz2 = new Matriz2D(d);
  matriz3 = new Matriz2D(3,3);
  matriz4 = new Matriz2D(4,4);
  matriz5 = new Matriz2D(b);
}
void draw(){
  matriz1.show(10,10);
  matriz2.show(150,10);
  
  matriz3 = matriz2.transpose();
  matriz3.show(300,10);
  
  matriz4.identity();
  matriz4.show(450,10);
  
  matriz1 = matriz2.plus(matriz3);
  matriz1.show(10,100);
  
  matriz1 = matriz2.minus(matriz3);
  matriz1.show(10,200);
  
  matriz1 = matriz2.times(matriz3);
  matriz1.show(10,300);
  
  matriz5.show(10,400);  
  println(matriz5.determinant());
  matriz5.show(300,400);
  
}

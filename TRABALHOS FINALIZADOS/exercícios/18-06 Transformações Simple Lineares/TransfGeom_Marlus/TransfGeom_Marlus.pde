 Matriz2D matrizObjeto, matrizTransf, matrizObjetoTransformado;
float [][] objeto = {{ 100, 150, 1},
                      {150, 150, 1},
                      {200, 100, 1},                      
                      {250, 150, 1},
                      {300, 150, 1},
                      {250, 200, 1},
                      {300, 250, 1}, 
                      {250, 250, 1},                      
                      {200, 300, 1},
                      {150, 250, 1},
                      {100, 250, 1},
                      {150, 200, 1},
                      {100, 150, 1}};                      

float tx, ty, sx, sy, a;
float r = 0; //fator de rotacao constante

void setup (){ 
  size(610,500);   
  //noLoop();  
  background(0);
  matrizObjeto = new Matriz2D(objeto);
  matrizObjeto.extrairCentro();
  //matrizTransf = new Matriz2D(3,3);
}

void draw(){
  
  stroke(255,0,0);
  matrizObjeto.desenhaObjeto(); // vermelho
  
  // Escala relativa ao próprio objeto
  matrizObjetoTransformado = matrizObjeto.Escalar(0.5,0.5, true);
  stroke(255,255,0);
  matrizObjetoTransformado.desenhaObjeto();
  
  
  matrizObjetoTransformado = matrizObjetoTransformado.Transladar(200,0);
  
  
  matrizObjetoTransformado = matrizObjetoTransformado.Escalar(2,2, true);
  stroke(0,0,255);
  matrizObjetoTransformado.desenhaObjeto();
  
  matrizObjetoTransformado = matrizObjetoTransformado.Transladar(0,150);
  
  matrizObjetoTransformado = matrizObjetoTransformado.Rotacionar(r, false);
  stroke(255,255,152);
  matrizObjetoTransformado.desenhaObjeto();
  r += 0.2;
}

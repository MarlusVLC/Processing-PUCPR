///////////////////////////////////////////////////////// classe Vetor

class Vetor {
  float xcomp;
  float ycomp;
  
  Vetor(float txcomp, float tycomp){
    xcomp = txcomp;
    ycomp = tycomp;
  }
  
  void Display(float xpos, float ypos, color c){
    stroke(c);
    line(xpos,height-ypos, xpos+xcomp,height-(ypos+ycomp));
    ellipse(xpos+xcomp,height-(ypos+ycomp),5,5);
    fill(c);
    text("v(m"+Magnitude()+")", (2*xpos+xcomp)/2, height-(2*ypos+ycomp)/2);
  }
  
  float Magnitude(){
     return sqrt(xcomp*xcomp+ycomp*ycomp); 
  }
  
  void MultEscalar(float k){
    xcomp = k * xcomp;
    ycomp = k * ycomp;
  }
  
  void SomaVetor(Vetor tVetor){
     xcomp = xcomp + tVetor.xcomp;
     ycomp = ycomp + tVetor.ycomp;
  }
  
  void SubtraiVetor(Vetor tVetor){
     xcomp = xcomp - tVetor.xcomp;
     ycomp = ycomp - tVetor.ycomp;     
  }
  
  float ProdutoEscalar(Vetor tVetor){
    return xcomp * tVetor.xcomp + ycomp * tVetor.ycomp;
  }
  
  boolean Ortogonal(Vetor tVetor){
    if (ProdutoEscalar(tVetor)==0) return true; else return false;
  }
  
  void Normalizar(){
     float Mag = Magnitude();
     xcomp = xcomp / Mag;
     ycomp = ycomp / Mag;
  }
}

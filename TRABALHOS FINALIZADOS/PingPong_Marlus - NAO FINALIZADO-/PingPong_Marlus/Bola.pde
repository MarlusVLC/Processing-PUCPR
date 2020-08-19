class Bola{
  float X_pos = width/2, Y_pos = height/2; 
  float raio = 8;
  int dominio;
  Vetor position,speed;

  
  Bola()
  {
    reposicionar();
  }
  
  
  public void desenha_bola(){
    circle(position.xcomp, position.ycomp, raio*2);
  }
  
  public void mover(){
    position.SomaVetor(speed);  
    //if (position.xcomp <= raio || position.xcomp >= width-raio)      speed.xcomp *= -1;
    if (position.ycomp <= raio || position.ycomp >= height-raio)     speed.ycomp *= -1; 
  }
  
  public void reposicionar(){
    position = new Vetor(width/2, height/2);
    float angulo = random(- PI/4, PI/4);
    speed = new Vetor(5*cos(angulo), 5*sin(angulo));
    if (random(1) < 0.5)  speed.xcomp *= -1;
 }
   
  //Checa interseccao entre as extremidades do círculo e o retângulo com um algoritmo de AABB 
  public void checaColisao(Barra barra){
    if (position.xcomp-raio < barra.X_pos+barra.padWidth &&
        position.xcomp+raio > barra.X_pos  &&
        position.ycomp - raio < barra.Y_pos + barra.padHeight &&
        position.ycomp + raio > barra.Y_pos)
        {
          float superficie = position.ycomp - barra.Y_pos ;
          float rad = radians(30);
          float angulo = (barra.padHeight/2*rad)*(superficie+rad);
          //float angulo = map(superficie, 0, barra.padHeight, -rad, rad);
          speed = new Vetor(5*cos(angulo), 5*sin(angulo));
          if (position.xcomp < barra.X_pos + barra.padWidth) 
            position.xcomp = (barra.X_pos - raio);
          else if (position.xcomp > barra.X_pos + barra.padWidth)
            position.xcomp = (barra.X_pos + barra.padWidth + raio);
          }
          checaDominio(barra);
        }
        
  public void checaDominio(Barra barra)
  {
    dominio = barra.player;
  }
  
  public void pontuar(){
    if (bola.position.xcomp+bola.raio < 0)               jogador1.score++;
    else if (bola.position.xcomp-bola.raio > width)      jogador2.score++;
    println(jogador1.score);
  }
}

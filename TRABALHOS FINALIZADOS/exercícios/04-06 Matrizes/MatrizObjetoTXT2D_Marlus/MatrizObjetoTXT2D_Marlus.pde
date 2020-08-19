// lê o arquivo texto contendo as coordenadas para ligá-las com linhas
// desenho do tipo "ligue os pontos"

int mO= 10000; int nO= 8; // matriz objeto 
float [][] matrizObjeto;

// inicializa matriz objeto, cada linha é uma coordenada
void inicializaMatrizObjeto(){
  parseFile();
}
 //<>// //<>//
// desenha Objeto
void desenhaObjeto(float [][] matriz){
  for(int i=0; i<mO; i++) {
    fill(matriz[i][5],matriz[i][6],matriz[i][7]);
    switch ((int)matriz[i][0]){
      case 1:
        rect(matriz[i][1],height-matriz[i][2],matriz[i][3],matriz[i][4]);
        break;
      case 2: 
        ellipse(matriz[i][1],height-matriz[i][2],matriz[i][3],matriz[i][4]);
        break;
      //default:
      //  println("ERRRRRRO!!!!");
    }
  }
}

//////////////////////////////////////////////////////////////////////

void setup(){
  size(650,550);
  //stroke(255,255,255);
  background(128);
  matrizObjeto = new float [mO][nO];
  inicializaMatrizObjeto();
}

void draw(){
  desenhaObjeto(matrizObjeto);
}

import java.util.*;

color vermelho = #ff0000, amarelo = #ff9900;
int cor_bg = 0;

//score é a pontuacao total, scoreCounter recebe scoreInicial e diminui com o tempo até chegar em no mínimo 100
//Quando um nivel é completo, o que restar do scoreCounter é somado em score.
int score, scoreCounter;
int scoreInicial = 1000;
int level;

PFont hud_font; 

int n_linhas  = 20;
int n_colunas = 20;
int tam_Hcelula = 20;
int tam_Vcelula = 20;
int tam_HUD = 100; //Tamanho da HUD que apresenta vida e pontuacao
int [][] mapa;

int objetivo_x, objetivo_y; //coordenadas do ponto objetivo, que leva o jogador ao proximo nivel.

ArrayList<Inimigo> inimigos = new ArrayList<Inimigo>();

Jogador jogador;
Inimigo npc00, npc01, npc02, npc03, npc04, npc05, npc06, npc07, npc08, npc09;

//int colPlayer=0, linPlayer=0;

void settings(){
  // para poder usar variáveis como parâmetros do size()
  size(n_colunas*tam_Hcelula, n_linhas*tam_Vcelula+tam_HUD);
}
  
void setup() {
  background(0);
  hud_font = createFont("8-BIT WONDER.TTF", 24); 
  mapa = new int[n_colunas][n_linhas];
  inicializa_mapa();
  scoreCounter = scoreInicial;
  score = 0; 
  level = 0;
  objetivo_x = 20; objetivo_y = 20;
  //randomiza_objetivo();  //coloca objetivo_x e objetivo_y em um valor de 10 à 20.
  jogador = new Jogador(0,0);
  npc00= new Inimigo(10,10);   inimigos.add(npc00);
  npc01 = new Inimigo(9, 12);  inimigos.add(npc01);
  npc02 = new Inimigo(7,5); inimigos.add(npc02);
  npc03 = new Inimigo(0,17); inimigos.add(npc03);
  npc04 = new Inimigo(8,4); inimigos.add(npc04);
  npc05 = new Inimigo(9,0); inimigos.add(npc05);
  npc06 = new Inimigo(19,0); inimigos.add(npc06);
  npc07 = new Inimigo(0,5); inimigos.add(npc07);
  npc08 = new Inimigo(6,1); inimigos.add(npc08);
  npc09 = new Inimigo(16,14); inimigos.add(npc09);
}

void draw(){
  stroke(128);
  desenha_mapa();
  edita_mapa();
  desenha_objetivo(objetivo_x, objetivo_y);  
  noStroke();
  for (int i=0; i<inimigos.size(); i++){
    if (i <= level){
      inimigos.get(i).Navega_Mapa();
      inimigos.get(i).desenha_entidade(vermelho);
      jogador.checa_colisao(inimigos.get(i));
    }  
  }
  if (jogador.getVidas() > 0 && level < 10){
    jogador.Navega_Mapa();
    jogador.desenha_entidade(amarelo);
    jogador.checa_objetivo();
    desenha_HUD();
  }
  else
  {
    GameOver();
  } 
}

class Matriz2D {
    private int M;             // numero de linhas
    private int N;             // numero de colunas
    private float[][] data;    // M-by-N array

    // cria a matriz M-by-N de zeros
    public Matriz2D(int M, int N) {
        this.M = M;
        this.N = N;
        data = new float[M][N];
    }
    
    // imprime a matriz na tela 
    public void show(int xpos, int ypos) {
    fill(255,0,0);
    int tx=xpos;
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
            text(data[i][j], xpos, ypos);
            xpos=xpos+40;
      }
      ypos=ypos+20;
      xpos=tx;
        }
    }

    // cria a matriz baseado num array2d de dados 
    public Matriz2D(float[][] data) {
        M = data.length;
        N = data[0].length;
        this.data = new float[M][N];
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                    this.data[i][j] = data[i][j];
    }

    // transforma em matriz identidade
    public void identity() {
      if(this.M==this.N) {
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                    if (i==j) this.data[i][j] = 1;
                    else this.data[i][j] = 0;
      } else println("Erro: Matriz Identidade somente com M = N");
    }

    // cria e retorna a transposta da matriz que invocou o método
    public Matriz2D transpose() {
        Matriz2D A = new Matriz2D(N, M);
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                A.data[j][i] = this.data[i][j];
        return A;
    }

    // return C = A + B
    public Matriz2D plus(Matriz2D B) {
        Matriz2D A = this;
        if (B.M == A.M && B.N == A.N){
          Matriz2D C = new Matriz2D(M, N);

          for (int i=0; i<C.M; i++){
            for (int j=0; j<C.N; j++){
              C.data[i][j] = A.data[i][j]+B.data[i][j];
            }
          }

          return C;}
        else {
          println("Erro: Matrizes de tamanhos diferentes");
          return A;
        }
    }

    // return C = A - B
    public Matriz2D minus(Matriz2D B) {
        Matriz2D A = this;
        if (B.M == A.M && B.N == A.N){
          Matriz2D C = new Matriz2D(M, N);

          for (int i=0; i<C.M; i++){
            for (int j=0; j<C.N; j++){
              C.data[i][j] = A.data[i][j]-B.data[i][j];
            }
          }

          return C;}
        else {
          println("Erro: Matrizes de tamanhos diferentes");
          return A;
        }
      
    }

    //// return C = A * B
    public Matriz2D times(Matriz2D B) {
      Matriz2D A = this;
      if (A.N == B.M ){
        Matriz2D C = new Matriz2D(A.M,B.N); 
        for (int i=0; i<A.M; i++){
          for (int j=0; j<A.N; j++){
            for (int k=0; k<B.N; k++){ 
              C.data[i][j]+=A.data[i][k]*B.data[k][j];
            }
          }
        }
        return C;
      } 
      else if (A.M == B.N){
        Matriz2D C = new Matriz2D(A.N,B.M);
        for (int i=0; i<A.N; i++){
          for (int j=0; j<A.M; j++){
            for (int k=0; k<B.M; k++){ 
              C.data[i][j]+=A.data[i][k]*B.data[k][j];
            }
          }
        }
        return C;
      }
      else{
        println("Erro: Uma matriz deve ter o tamanho da linha semelhante ao tamanho da coluna da outra"); 
        return A;
    }
      
    }

    // calcula determinante (método de triangularização)
    // triangulariza a matriz que invoca o método
    public float determinant(){
      Matriz2D A = this;
      if (M==N) {
        float temp, factor; 
        int count = 0;
        // faz a transformação em um triangulo...
        for(int i = 0; i < M - 1; i++)
        {
            if(A.data[i][i] == 0)
            {
                for(int k = i; k < M; k++)
                {
                    if(A.data[k][i] != 0)
                    {
                        for(int j = 0; j < M; j++)
                        {
                            temp = A.data[i][j];
                            A.data[i][j] = A.data[k][j];
                            A.data[k][j] = temp;
                        }
                        k = M;
                    }
                }
                count++;
            } 
            if(A.data[i][i] != 0)
            {
                for(int k = i + 1; k < M; k++)
                {
                    factor = -1.0 * A.data[k][i] /  A.data[i][i];
                    for(int j = i; j < M; j++)
                    {
                        A.data[k][j] = A.data[k][j] + (factor * A.data[i][j]);
                    }
                }
            }
        } 
        temp = 1.0;
        // Calcula o determinante, multiplica a diagonal
        for(int i = 0; i < M; i++) temp = temp * A.data[i][i]; //<>//
        return temp; 
        }
        else {
        println("Erro: A Matriz não é quadrada");
        return 0;
        }
    }
}

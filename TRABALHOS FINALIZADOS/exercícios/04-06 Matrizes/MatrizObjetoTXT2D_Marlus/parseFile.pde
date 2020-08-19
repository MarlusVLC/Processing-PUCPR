int contX=0;int contY=0;

void parseFile() {
  BufferedReader reader = createReader("poligonos.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = split(line, ' ');
      for (int i=0; i<nO; i++)     matrizObjeto[contX][i] = int(pieces[i]);
      contX++;
    }
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
} 

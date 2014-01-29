int cFondo, cFichas;
Ficha[] fichas = new Ficha[9];

void setup() {
  size(300, 300);
  inicia();
}

void inicia() {
  for (int i = 0; i<9; i++) {
    fichas[i] = new Ficha(i, i%3);
  }
  cFondo = 0;
  cFichas = 255;
}

void draw() {
  background(cFondo);
  strokeWeight(1);
  stroke(cFichas);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  for (int i = 0; i<9; i++) {
    fichas[i].dibuja();
  }
}

class Ficha {
  int posicion, x, y, tipo;
  Ficha(int posicion, int tipo) {
    this.posicion = posicion;
    this.x = (posicion % 3) * 100 + 50;
    this.y = (posicion / 3) * 100 + 50;
    this.tipo = tipo;
  }
  void dibuja() {
    switch (tipo) {
    case 1:
      strokeWeight(70);
      stroke(cFichas);
      point(x, y);
      strokeWeight(50);
      stroke(cFondo);
      point(x, y);
      break;
    case 2:
      strokeWeight(10);
      stroke(cFichas);
      line(x-30, y-30, x+30, y+30);
      line(x-30, y+30, x+30, y-30);
      break;
    default:
      break;
    }
  }
}

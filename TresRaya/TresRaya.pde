int cFondo = 0, cFichas = 255;
Ficha fichaA, fichaB; 

void setup() {
  size(300, 300);
  fichaA = new Ficha(50, 50, 1);
  fichaB = new Ficha(150, 50, 2);
}

void draw() {
  background(cFondo);
  strokeWeight(1);
  stroke(cFichas);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  fichaA.dibuja();
  fichaB.dibuja();
}

class Ficha {
  int x, y, tipo;
  Ficha(int x, int y, int tipo) {
    this.x = x;
    this.y = y;
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

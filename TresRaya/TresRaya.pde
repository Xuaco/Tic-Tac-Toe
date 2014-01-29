int cFondo = 0, cFichas = 255;

void setup() {
  size(300, 300);
}

void draw() {
  background(cFondo);
  strokeWeight(1);
  stroke(cFichas);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  dibujaFichaO(50, 50);
  dibujaFichaO(150,50);
  dibujaFichaX(150, 150);
}

void dibujaFichaO(int x, int y){
      strokeWeight(70);
      stroke(cFichas);
      point(x, y);
      strokeWeight(50);
      stroke(cFondo);
      point(x, y);
}

void dibujaFichaX(int x, int y){
      strokeWeight(10);
      stroke(cFichas);
      line(x-30, y-30, x+30, y+30);
      line(x-30, y+30, x+30, y-30);
}


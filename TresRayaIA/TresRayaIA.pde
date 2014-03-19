int cFondo, cFichas, jugador, colocadas, a, c;
boolean FIN;
Ficha[] fichas = new Ficha[9];
int mov;
int [] minimax = new int[9];

void setup() {
  size(300, 300);
  inicia();
  int i=9*8*7*6*5*4*3*2;
  print(i);
}

void inicia() {
  for (int i = 0; i<9; i++) {
    fichas[i] = new Ficha(i, 0);
    minimax[i] = 0;
  }
  cFondo = 0;
  cFichas = 255;
  frameRate(10);
  jugador = 1;
  colocadas = 0;
  FIN = false;
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
  if (FIN) {
    strokeWeight(10);
    stroke(cFichas);
    line(fichas[a].x, fichas[a].y, fichas[c].x, fichas[c].y);
  }
}

void mousePressed() {
  if (colocadas == 9 || FIN)
    inicia();
  else if (fichas[(mouseX / 100) + (mouseY / 100) * 3].setTipo(jugador)) {
    jugador = (jugador == 1)? 2: 1;
    colocadas ++;
    mov = movimiento();
    fichas[mov].setTipo(jugador);
    jugador = (jugador ==1)? 2: 1;
    colocadas ++;
    FIN = check();
    if (colocadas == 9 || FIN) {
      jugador = 1;
      cFondo = 255;
      cFichas = 0;
    }
  } 
  else background(cFichas);
}

boolean check() {
  return (enLinea(0, 1, 2) || enLinea(3, 4, 5) || enLinea(6, 7, 8) || enLinea(0, 3, 6) || 
    enLinea(1, 4, 7) || enLinea(2, 5, 8) || enLinea(0, 4, 8) || enLinea(2, 4, 6));
}

boolean enLinea (int a, int b, int c) {
  if (fichas[a].tipo != 0 && fichas[a].tipo == fichas[b].tipo && 
    fichas[b].tipo == fichas[c].tipo) {
    this.a = a;
    this.c = c;
    return true;
  } 
  else 
    return false;
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
  boolean setTipo(int tipo) {
    if (this.tipo == 0) {
      this.tipo = tipo;
      minimax[posicion] = tipo;
      return true;
    }
    else return false;
  }
}

int movimiento() {
  int posicion = 0, resultado;
  FIN = check();
  if (colocadas == 9 || FIN) return 0;
  for (int i=0; i<9 ; i++) {
    if (minimax[i] == 0) {
      minimax[i]=2;
      aux = Min();
      if (resultado < aux) {
        resultado = aux;
        posicion = i;
      }
    }
  }
  return posicion;
}

int Min() {
  if (check()) return 1;
  if (colocadas == 9) return 0;
  int resultado = 9;
  for (int i=0; i<9; i++) {
    if (fichas[i].tipo == 0)
      resultado = Max();
  }
  return resultado;
}

int Max() {
  if (check()) return -1;
  if (colocadas == 9) return 0;
  int resultado = -9;
  for (int i=1;i<9; i++) {
    if (fichas[i].tipo == 0)
      resultado = Min();
  }
  return resultado;
}


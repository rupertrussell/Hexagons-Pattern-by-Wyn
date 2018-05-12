float startX;
float startY;
float endX;
float endY;
float x;
float y;
float h = 150; 
float k = 150;
float r = 40;
boolean start = true;
int count = 0;
double step;
float yGap = 161; // 160
int hexSize = 180;
int stopAt = 0;
int leftMargin = - 500;
int bottomMargin = 3000;
int stepSize = 2;

// 2875 × 3900 T-Shirt
// 3502 × 2385 Journal
// 1765 × 2481 notebook
// 2344 × 2467 poster 
// 2940 × 2940 clock
// 5748 × 5748 scarves
// 6310 × 6230 A-Line Dress
// 7632 × 6480 Tapestries
// 2376 × 2024 Travel Mug
// 2700 × 1624 Tall Mug
// 9144 × 6096 extra large print
// 7632 × 6480 Duvet Covers
// 2875 × 3900 Long T-Shirt
// 2696 × 3305 iPad Case
// 4600 × 3000 laptop Skin
// 4600 × 3000 Phone Cases & Skins

int repeatXtimes = 60; // width
int repeatYtimes = 60;// height

int heightOffset = 3305 - 500 ; // height
int widthOffset = 140;

// How to calculate points on a circle
// Based on code from http://www.mathopenref.com/coordcirclealgorithm...

void setup() {
  background(0); 
  strokeWeight(9); 
  size(7000, 7000); // width x height
  smooth();
  // noLoop();
  strokeCap(ROUND);
}

void draw() {
  background(0);
  stopAt = stopAt +1;
  widthOffset = 140 + stopAt;
  heightOffset =heightOffset + stopAt;
  stroke(255);

  for (int i = -100; i <= repeatXtimes; i++) {
    if (isEven(i)) {
      stack(leftMargin + i * widthOffset, bottomMargin + heightOffset, repeatYtimes );
    } else {
      stack(leftMargin + i * widthOffset, bottomMargin + heightOffset + 80, repeatYtimes + 1); // was 80
    }
  }

  save("Hex5-" + stopAt +".png");
  if (stopAt == 50) {
    exit();
  }
} // end draw

void hexagon(int radius) {
  count = 0;
  start = true;

  step = 2 * PI/6; 
  for (float theta=0; theta < 2 * PI; theta += step) {
    x = h + radius * cos(theta);
    y = k - radius * sin(theta); //note 2.
    // point(x, y);

    if (start == true) {
      startX = x;
      startY = y;
      if (count != 0) {
        line(endX, endY, startX, startY);
      }
    }

    if (start == false) {
      endX = x;
      endY = y;

      line(startX, startY, endX, endY);
    }
    count ++;
    if (start == true) {
      start = false;
    } else {
      start = true;
    }
  } // end void hexagon
}

void stack(float transX, float transY, int num) { 
  pushMatrix();
  translate(transX, transY);
  for (int i = 0; i < num; i++) {
    hex();
    translate(0, -yGap);
  }
  popMatrix();
} // end void stack

void hex() {

  //hexagon(5);
  //hexagon(7);
  //hexagon(10);
  //hexagon(15);
  //hexagon(20);
  //hexagon(25);
  //hexagon(30);
  //hexagon(50);

  hexagon(150);
  // hexagon(90);
  // hexagon(90);
} // end void hex

boolean isEven(int n) {
  return n % 2 == 0;
}

boolean isOdd(int n) {
  return n % 2 != 0;
}

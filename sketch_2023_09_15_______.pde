float [] a, b, c, vx, vy;
float [] a1, b1, c1, vx1, vy1;
float [] a2, b2, c2, vx2, vy2;
float d;
float x = 400;
float y = 500;
float z = 10;
boolean gameOver = false;
long startTime;
long elapsedTime = 0;




//[]array 변수를 사용하겠다.
void setup() {
  size(1000, 1000); // width 600 height 300
  a = new float[10];
  b = new float[10];
  c = new float[10];
  vx = new float[10];
  vy = new float[10];
  a1 = new float[10];
  b1 = new float[10];
  c1 = new float[10];
  vx1 = new float[10];
  vy1 = new float[10];
  a2 = new float[10];
  b2 = new float[10];
  c2 = new float[10];
  vx2 = new float[10];
  vy2 = new float[10];
  for (int i=0; i<3; i++) {   //(초기조건, 계속조건, 매스탭진행)
    a[i] = random(width);
    b[i] = random(height);
    c[i] = random(5, 10);
    vx[i] = random(1, 1.3);
    vy[i] = random(1, 1.3);
    a1[i] = random(width);
    b1[i] = random(height);
    c1[i] = random(8, 10);
    vx1[i] = random(1, 3);
    vy1[i] = random(1, 3);
    a2[i] = random(width);
    b2[i] = random(height);
    c2[i] = random(5, 10);
    vx2[i] = random(1, 1.3);
    vy2[i] = random(1, 1.3);
  }
   size(1000, 1000);
  // ... (이전 설정 코드 생략)
  startTime = millis(); // 게임 시작 시간 기록
}




void draw() {
  int startTime = second();
  background(255); 
  for (int i=0; i<3; i++) {
    a[i] += vx[i];
    b[i] += vy[i];
    a1[i] += vx1[i];
    b1[i] += vy1[i];
    a2[i] += vx2[i];
    b2[i] += vy2[i];
    ryan(a1[i], b1[i], c1[i]);
    person(x, y, z);
    minji(a[i], b[i], c[i]);
    minseo(a2[i], b2[i], c2[i]);

    if (a[i]>width || a[i] < 0) vx[i] = -vx[i];
    if (b[i]>height || b[i] < 0) vy[i] = -vy[i];
    if (a1[i]>width || a1[i] < 0) vx1[i] = -vx1[i];
    if (b1[i]>height || b1[i] < 0) vy1[i] = -vy1[i];
    if (a2[i]>width || a2[i] < 0) vx2[i] = -vx2[i];
    if (b2[i]>height || b2[i] < 0) vy2[i] = -vy2[i];
    
     if (keyPressed) {
      float speed = 3;

      if (key == 'w') {
        y -= speed;
      } else if ( key == 's') {
        y +=speed;
      } else if (key == 'a') {
        x -= speed;
      } else if (key == 'd') {
        x += speed;
      }
    }
    
    // 캐릭터와 person 충돌 검사
    float distance1 = dist(a[i], b[i], x, y); // 캐릭터와 person 간의 거리'
    float distance2 = dist(a1[i], b1[i], x, y);
    float distance3 = dist(a2[i], b2[i], x, y);
    if (distance1 < (c[i]*10/2 + z/ 2) || distance2 < (c1[i]*20/2 + z/ 2) || distance3 < (c2[i]*20/2 + z/2)) {
      // 충돌하면 각 캐릭터를 랜덤한 방향으로 이동
      gameOver = true;
    }
  }
if (!gameOver) {
   person(x,y,z);
  } else {
    // 게임이 종료되었을 때 경과 시간을 출력
    fill(0);
    textSize(60);
    textAlign(CENTER, CENTER);
    String message = "Game Over"; // 밀리초를 초로 변환
    text(message, width / 2, height / 2);
    if (keyPressed && key == 'r') {
      gameOver = false;
       // 게임 재시작 시간 기록
    }
  }
}







void minji(float x, float y, float z) {
  fill(#fbceb1); // 캐릭터 색상
  circle(x, y, z*10);
  arc(x-z*2, y-z, z*2, z*2, PI, 2*PI);
  arc(x+z*2, y-z, z*2, z*2, PI, 2*PI);
  fill(255, 0, 0);
  arc(x, y+z*2, z*6, z*2, 0, PI);
}



void person(float x, float y, float d) {

  strokeWeight(4);
  ellipse(x, y - d, d, d); // 원을 그려 머리를 표현

  // 몸통
  stroke(0);
  line(x, y, x, y + 2 * d); // 몸통을 선으로 그리기

  // 왼팔
  line(x, y + d, x - d, y + 2 * d); // 왼팔을 선으로 그리기

  // 오른팔
  line(x, y + d, x + d, y + 2 * d); // 오른팔을 선으로 그리기

  // 왼다리
  line(x, y + 2 * d, x - d, y + 4 * d); // 왼다리를 선으로 그리기

  // 오른다리
  line(x, y + 2 * d, x + d, y + 4 * d);
}

void ryan(float x, float y, float z) {
  face(x, y, z);
  ear(x-50, y-83, z);
  nose(x, y+10, z);
}
void face(float x, float y, float z) {
  fill(211, 154, 30);
  strokeWeight(5);
  circle(x, y, z*20);
  fill(0, 0, 0);
  circle(x-40, y-10, z);
  circle(x+40, y-10, z);
}

void ear(float x, float y, float z) {

  fill(211, 154, 30);
  circle(x, y, z*5);
  circle(x+100, y, z*5);
}

void nose(float x, float y, float z) {
  fill(250, 250, 250);
  arc(x+15, y+15, 30, 30, radians(0), radians(360));
  arc(x-15, y+15, 30, 30, radians(0), radians(360));
  line(x-20, y, x+20, y);
  noStroke();
  rect(x-19, y+4, 37, 15);
  strokeWeight(5);
  fill(0, 0, 0);
  circle(x, y, z+4);
}

void minseo(float x, float y, float d) {

  // 얼굴 그리기 (원)
  fill(150);  // 색상 설정 (흰색)
  ellipse(x, y, d*20, d*20);  // 원 그리기 (중심 x, 중심 y, 너비, 높이)

  // 눈 그리기 (두 개의 원)
  fill(0);  // 색상 설정 (검은색)
  ellipse(x-5*d, y-2*d, 3*d, 3*d);  // 왼쪽 눈
  ellipse(x+5*d, y-2*d, 3*d, 3*d);  // 오른쪽 눈

  // 입 그리기 (호)

  noFill();  // 색상 없음
  stroke(0);  // 선 색상 설정 (검은색)
  arc(x, y+2*d, 8*d, 4*d, 0, PI);  // 입 그리기
  fill(150);
  triangle(x-10.5*d, y-10.5*d, x-4.5*d, y-9.5*d, x-9.5*d, y-4.5*d);
  triangle(x+4.5*d, y-9.5*d, x+10.5*d, y-10.5*d, x+9.5*d, y-4.5*d);
  line(x, y+d, x, y+4*d);
}

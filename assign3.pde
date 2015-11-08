//You should implement your assign3 here.
PImage start2,start1,backGround1,backGround2,fighter,treasure,hp;
int backGround1x=0,backGround2x=640,treasurex=(int)random(620),treasurey=(int)random(430),enemyx=0,enemyy=(int)random(430),k=40,playA=0;
PImage[] enemy =new PImage[18];
float fighterx=580;
float fightery=220;
float speed = 5;
boolean upPressed,playing= false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
void setup () {
  size(640, 480) ;
  start2=loadImage("img/start2.png");
  start1=loadImage("img/start1.png");
  backGround1 = loadImage("img/bg1.png");
  backGround2 = loadImage("img/bg2.png");
  fighter = loadImage("img/fighter.png");
  treasure = loadImage("img/treasure.png");
  for(int i=0;i<18;i++){
  enemy[i] = loadImage("img/enemy.png");}
  hp = loadImage("img/hp.png");
}

void draw() {
  image(start2,0,0);
  if(pmouseX>=100&&pmouseX<=540&&pmouseY>=300&&pmouseY<=420){
    image(start1,0,0);
  }
  if(mousePressed){
    if(pmouseX>=100&&pmouseX<=540&&pmouseY>=300&&pmouseY<=420)
    playing=true;
  }
  if (upPressed) {
    fightery -= speed;
  }
  if (downPressed) {
    fightery += speed;
  }
  if (leftPressed) {
    fighterx -= speed;
  }
  if (rightPressed) {
    fighterx += speed;
  }
  if (fighterx >=580) {
    fighterx -=speed;
  }
  if (fighterx <=0) {
    fighterx +=speed;
  }
  if (fightery <=0) {
    fightery +=speed;
  }
   if (fightery >=430) {
    fightery -=speed;
  }
   if (treasurex >=fighterx-5 && treasurey>=fightery-10  && treasurey<=fightery+60 && treasurex <=fighterx+60 && k<200) {
    k+=20;treasurex=(int)random(600);treasurey=(int)random(430);
  }
  if (treasurex >=fighterx-5 && treasurey>=fightery-10  && treasurey<=fightery+60 && treasurex <=fighterx+60 ) {
    ;treasurex=(int)random(600);treasurey=(int)random(430);
  }
  if(playing){
  background(0);
  image(backGround1,backGround1x-640,0);
  image(backGround2,backGround2x-640,0);
  image(fighter,fighterx,fightery);
  image(treasure,treasurex,treasurey);
  backGround1x%=1280;backGround2x%=1280;
  enemyx+=3;
   
  if(playA==0){
  for(int i=0;i<5;i++){
    image(enemy[i],enemyx-60*i,enemyy);
    if (enemyx-60*5 >= 640) {
    enemyx=0;enemyy=(int)random(245,430);playA=1;}}}
     if(playA==1){
    for(int i=0;i<5;i++){
    image(enemy[i],enemyx-60*i,enemyy-50*i);
    if (enemyx-60*5 >= 640) {
    enemyx=0;enemyy=(int)random(95,335);playA=2;}}}
     if(playA==2){
    image(enemy[0],enemyx,enemyy+50*0);
    image(enemy[1],enemyx-60*1,enemyy+50*1);
    image(enemy[2],enemyx-60*2,enemyy+50*2);
    image(enemy[3],enemyx-60*3,enemyy+50*1);
    image(enemy[4],enemyx-60*4,enemyy);
    image(enemy[5],enemyx-60*(5-4),enemyy-50*(5-4));
    image(enemy[6],enemyx-60*(6-3),enemyy-50*(6-5));
    image(enemy[7],enemyx-60*(7-5),enemyy-50*(7-5));
    if (enemyx-60*5 >= 640) {enemyx=0;enemyy=(int)random(430);
    playA=0;}}  
    image(hp,40,40);
  fill(255,0,0,75);
    rect(45,45,k,20,100);                    
  }}
  

void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased(){
  if (key == CODED) {
      switch (keyCode) {
        case UP:
          upPressed = false;
          break;
        case DOWN:
          downPressed = false;
          break;
        case LEFT:
          leftPressed = false;
          break;
        case RIGHT:
          rightPressed = false;
          break;}}
}

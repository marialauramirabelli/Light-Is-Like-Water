import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
import processing.sound.*;

import processing.serial.*;
Serial myPort;

SoundFile beginSound;
AudioPlayer iESP, iiESP, iiiESP, ivESP, vESP, viESP, viiESP;
AudioPlayer iENG, iiENG, iiiENG, ivENG, vENG, viENG, viiENG;

PFont font1, font2;
boolean startESP, startENG;
int colorChange;
int colorChangerESP, colorChangerESP1, colorChangerESP2, colorChangerESP3;
int colorChangerENG, colorChangerENG1, colorChangerENG2, colorChangerENG3;
String intro1, intro2, intro3, intro4, intro5, intro6, intro7;
int alphaCounter1, alphaCounter2;
boolean alpha;
boolean begin, narration, story, end, restart;
int track;
int bgColor;
String text1, subtext1, text2, text3, text4, text5;
String og, tr, na;
int serialComm;
int stage;

void menu(){
 textAlign(LEFT);
 if(mouseX >= width/10*2.5 && mouseX <= width/10*4.5 
 && mouseY >= height/9*4 && mouseY <= height/9*5){
 if(mousePressed){
 startESP = true;
 }
 else{
 if(colorChangerESP < colorChange){
 colorChangerESP = colorChange;
 }
 if(colorChangerESP1 < colorChange - 30){
 colorChangerESP1 = colorChange - 30;
 }
 if(colorChangerESP2 < colorChange - 60){
 colorChangerESP2 = colorChange - 60;
 }
 if(colorChangerESP3 < colorChange - 90){
 colorChangerESP3 = colorChange - 90;
 }
 if(colorChangerESP3 < 255){
 colorChangerESP+=10;
 colorChangerESP1+=10;
 colorChangerESP2+=10;
 colorChangerESP3+=10;
 }
 };
 }
 else{
 colorChangerESP-=10;
 colorChangerESP1-=10; 
 colorChangerESP2-=10;
 colorChangerESP3-=10;
 };
 if(mouseX >= width/10*5.5 && mouseX <= width/10*7.5 
 && mouseY >= height/9*4 && mouseY <= height/9*5){
 if(mousePressed){
 startENG = true;
 }
 else{
 if(colorChangerENG < colorChange){
 colorChangerENG = colorChange;
 }
 if(colorChangerENG1 < colorChange - 30){
 colorChangerENG1 = colorChange - 30;
 }
 if(colorChangerENG2 < colorChange - 60){
 colorChangerENG2 = colorChange - 60;
 }
 if(colorChangerENG3 < colorChange - 90){
 colorChangerENG3 = colorChange - 90;
 }
 if(colorChangerENG3 < 255){
 colorChangerENG+=10;
 colorChangerENG1+=10; 
 colorChangerENG2+=10;
 colorChangerENG3+=10;
 }
 };
 }
 else{
 colorChangerENG-=10;
 colorChangerENG1-=10; 
 colorChangerENG2-=10;
 colorChangerENG3-=10;
 }
 colorMode(HSB);
 noFill();
 strokeWeight(4);
 stroke(35, 100, colorChangerESP1);
 rect(width/10*2.5, height/9*4, width/10*2, height/9);
 stroke(140, 100, colorChangerENG1);
 rect(width/10*5.5, height/9*4, width/10*2, height/9);
 strokeWeight(3);
 stroke(35, 100, colorChangerESP2);
 rect(width/10*2.5 - 10, height/9*4 - 10, width/10*2 + 20, height/9 + 20);
 stroke(140, 100, colorChangerENG2);
 rect(width/10*5.5 - 10, height/9*4 - 10, width/10*2 + 20, height/9 + 20);
 strokeWeight(2); 
 stroke(35, 100, colorChangerESP3);
 rect(width/10*2.5 - 17.5, height/9*4 - 17.5, width/10*2 + 35, height/9 + 35);
 stroke(140, 100, colorChangerENG3);
 rect(width/10*5.5 - 17.5, height/9*4 - 17.5, width/10*2 + 35, height/9 + 35);
 fill(30, 100, colorChangerESP);
 text("español", width/10*3, height/9*4.65);
 fill(140, 100, colorChangerENG);
 text("english", width/10*6, height/9*4.65);
}

void begin(){
 if(startESP){
 intro1 = "La luz";
 intro2 = " es como el agua:";
 intro3 = "uno abre el grifo,";
 intro4 = " y sale.";
 intro5 = "Esta es una experiencia interactiva audiovisual.";
 intro6 = "La historia será transmitida por audio, las instrucciones aparecerán en la pantalla, y la casa cobrará vida."; 
 intro7 = "Haz click para continuar.";
 bgColor = 140;
 }
 else if(startENG){
 intro1 = "Light";
 intro2 = "is like water:";
 intro3 = "one turns the tap,";
 intro4 = "and out it comes.";
 intro5 = "This is an audiovisual interactive experience.";
 intro6 = "The story will be transmitted by audio, the instructions will appear on screen, and the house will come to life.";
 intro7 = "Click to continue.";
 bgColor = 22;
 };
 if(begin == false && alphaCounter1 >= 20){
 beginSound.play();
 begin = true;
 };
 if(alpha == false){
 alphaCounter1++;
 if(alphaCounter1 > 65){
 alphaCounter2++;
 }
 };
 if(alphaCounter2 >= 240){
 fill(bgColor, 100, 255, alphaCounter2 - 240);
 rect(0, 0, width, height);
 if(mousePressed){
 beginSound.stop();
 narration = true;
 };
 };
 textSize(250);
 fill(0, alphaCounter1);
 text(intro1, width/10*2, height/9*3.5);
 textSize(100);
 fill(0, alphaCounter2);
 text(intro2, width/10*5, height/9*4);
 fill(0, alphaCounter1 - 150);
 text(intro3, width/10*2, height/9*5);
 textSize(170);
 fill(0, alphaCounter2 - 145);
 text(intro4, width/10*3, height/9*6.5);
 textSize(50);
 fill(0, alphaCounter2 - 200);
 text("- Gabriel García Márquez", width/10*6, height/9*8);
 fill(255);
 textFont(font1);
 text(intro5, width/50, height/15);
 text(intro6, width/50, height/15 + 30);
 text(intro7, width/50, height/15 + 60);
}

void story(){
 textAlign(CENTER);
 textFont(font1);
 fill(0);
 if(story == false){
 alphaCounter1 = -10;
 if(track == 1){
 if(startENG == true){
 iENG.play();
 }
 else if(startESP == true){
 iESP.play();
 };
 }
 else if(track == 2){
 if(startENG == true){
 iiENG.play();
 }
 else if(startESP == true){
 iiESP.play();
 };
 }
 else if(track == 3){
 if(startENG == true){
 iiiENG.play();
 }
 else if(startESP == true){
 iiiESP.play();
 };
 }
 else if(track == 4){
 if(startENG == true){
 ivENG.play();
 }
 else if(startESP == true){
 ivESP.play();
 };
 }
 else if(track == 5){
 if(startENG == true){
 vENG.play();
 }
 else if(startESP == true){
 vESP.play();
 };
 }
 else if(track == 6){
 if(startENG == true){
 viENG.play();
 }
 else if(startESP == true){
 viESP.play();
 };
 }
 else if(track == 7){
 if(startENG == true){
 viiENG.play();
 }
 else if(startESP == true){
 viiESP.play();
 };
 };
 story = true;
 }
 else{
 if(track == 1){
 if(startENG == true){
 text1 = "Connect all the cables to the positive rail";
 subtext1 = "(along the red line)";
 }
 else if(startESP == true){
 text1 = "Conecta todos los cables al bus positivo";
 subtext1 = "(a lo largo de la línea roja)";
 };
 if(! iENG.isPlaying() && ! iESP.isPlaying()){
 stage = 0;
 alphaCounter1++;
 fill(0, alphaCounter1);
 text(text1, width/2, height/2);
 text(subtext1, width/2, height/2 + 35);
 if(serialComm == 1){
 story = false;
 track++;
 };
 };
 }
 else if(track == 2){
 if(startENG == true){
 text2 = "Disconnect the green cable";
 }
 else if(startESP == true){
 text2 = "Desconecta el cable verde";
 };
 if(! iiENG.isPlaying() && ! iiESP.isPlaying()){
 stage = 1;
 alphaCounter1++;
 fill(0, alphaCounter1);
 text(text2, width/2, height/2);
 if(serialComm == 2){
 story = false;
 track++;
 };
 };
 }
 else if(track == 3){
 if(startENG == true){
 text3 = "Disconnect the red cable";
 }
 else if(startESP == true){
 text3 = "Desconecta el cable rojo";
 };
 if(! iiiENG.isPlaying() && ! iiiESP.isPlaying()){
 stage = 2;
 alphaCounter1++;
 fill(0, alphaCounter1);
 text(text3, width/2, height/2);
 if(serialComm == 3){
 story = false;
 track++;
 };
 };
 }
 else if(track == 4){
 if(startENG == true){
 text4 = "Disconnect the blue cable";
 }
 else if(startESP == true){
 text4 = "Desconecta el cable azul";
 };
 if(! ivENG.isPlaying() && ! ivESP.isPlaying()){
 stage = 3;
 alphaCounter1++;
 fill(0, alphaCounter1);
 text(text4, width/2, height/2);
 if(serialComm == 4){
 story = false;
 track++;
 };
 };
 }
 else if(track == 5){
 if(startENG == true){
 text5 = "Disconnect the yellow cable";
 }
 else if(startESP == true){
 text5 = "Desconecta el cable amarillo";
 };
 if(! vENG.isPlaying() && ! vESP.isPlaying()){
 stage = 4;
 alphaCounter1++;
 fill(0, alphaCounter1);
 text(text5, width/2, height/2);
 if(serialComm == 5){
 story = false;
 track++;
 };
 };
 }
 else if(track == 6){
 if(! viENG.isPlaying() && ! viESP.isPlaying()){
 stage = 5;
 if(serialComm == 6){
 story = false;
 track++;
 };
 };
 }
 else if(track == 7){
 if(! viiENG.isPlaying() && ! viiESP.isPlaying()){
 stage = 6;
 end = true;
 alphaCounter2 = -10;
 };
 };
 };
}

void credits(){
 fill(bgColor, 100, 255, alphaCounter2);
 alphaCounter2++;
 rect(0, 0, width, height);
 textAlign(CENTER);
 textFont(font2);
 fill(0, alphaCounter2);
 if(startENG == true){
 og = "Original story";
 tr = "Translation and editing";
 na = "Narration";
 }
 else if(startESP == true){
 og = "Cuento original";
 tr = "Edición";
 na = "Narración";
 };
 textSize(70);
 text(og, width/2, height*0.25);
 textSize(50);
 text("Gabriel García Márquez", width/2, height*0.32);
 textSize(70);
 text(tr, width/2, height*0.5);
 textSize(50);
 text("María Laura Mirabelli", width/2, height*0.57);
 textSize(70);
 text(na, width/2, height*0.75);
 textSize(50);
 text("Sebastián Rojas Cabal", width/2, height*0.82);
 if(startESP == true){
 intro5 = "Haz click para finalizar";
 }
 else if(startENG == true){
 intro5 = "Click to end";
 };
 textAlign(LEFT);
 fill(255);
 textFont(font1);
 text(intro5, width/50, height/15);
 if(mousePressed){
 restart = true;
 };
};

void setup(){
 String portName = Serial.list()[2];
 myPort = new Serial (this, portName, 9600);
 myPort.clear();
 myPort.bufferUntil('\n');
 
 fullScreen();
 font1 = createFont("Arvo-Bold.ttf", 30);
 font2 = createFont("Handycheera.otf", 70);
 
 setupStuff();
}

void setupStuff(){
 startESP = startENG = false;
 colorChange = 200;
 colorChangerESP = colorChangerESP1 = colorChangerESP2 = colorChangerESP3 = 0;
 colorChangerENG = colorChangerENG1 = colorChangerENG2 = colorChangerENG3 = 0;
 intro1 = intro2 = intro3 = intro4 = intro5 = intro6 = intro7 = "";
 alphaCounter1 = alphaCounter2 = -10;
 alpha = false;
 begin = narration = story = end = restart = false;
 bgColor = 0;
 track = 1;
 serialComm = 0;
 stage = -1;
 
 beginSound = new SoundFile(this, "beginSound.wav");
 minim = new Minim(this);
 iESP = minim.loadFile("I.wav");
 iiESP = minim.loadFile("II.wav");
 iiiESP = minim.loadFile("III.wav");
 ivESP = minim.loadFile("IV.wav");
 vESP = minim.loadFile("V.wav");
 viESP = minim.loadFile("VI.wav");
 viiESP = minim.loadFile("VII.wav");
 iENG = minim.loadFile("1.wav");
 iiENG = minim.loadFile("2.wav");
 iiiENG = minim.loadFile("3.wav");
 ivENG = minim.loadFile("4.wav");
 vENG = minim.loadFile("5.wav");
 viENG = minim.loadFile("6.wav");
 viiENG = minim.loadFile("7.wav");
}

void draw(){
 background(255);
 textFont(font2);
 if(startESP == false && startENG == false){
 narration = false;
 menu();
 }
 else{
 if(narration == false){
 begin();
 }
 else{
 if(end == false){
 story();
 }
 else{
 if(restart == true){
 setupStuff();
 };
 credits();
 };
 };
 };
}

void serialEvent(Serial myPort){
 String s = myPort.readStringUntil('\n');
 s = trim(s);
 //println(s);
 if(s != null){
 serialComm = int(s);
 };
 myPort.write(stage);
}

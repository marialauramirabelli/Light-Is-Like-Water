#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h>
#endif

#include <Servo.h>

Servo boatRight;
Servo boatLeft;

const int ledGreen = 10;
const int ledRed = 11;
const int ledBlue = 2;
const int ledYellow = 13;

const int tallLeft= 8;
const int shortLeft = 7;
const int tallRight = 4;
const int shortRight = 3;

const int PIN = 6;

const int NUMPIXELS = 180;

int stage;

int serialComm;

const int colors[] = {47, 86, 233, 45, 100, 245, 47, 141, 255, 51, 171, 249,
52, 204, 255, 82, 219, 255};
const int colorsFire[] = {255, 127, 0, 255, 143, 0, 255, 105, 0, 229, 83, 0};

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

void setup() {
 pinMode(ledGreen, INPUT);
 pinMode(ledRed, INPUT);
 pinMode(ledBlue, INPUT);
 pinMode(ledYellow, INPUT);
 pinMode(tallLeft, OUTPUT);
 pinMode(shortLeft, OUTPUT);
 pinMode(tallRight, OUTPUT);
 pinMode(shortRight, OUTPUT);

boatRight.attach(9); 
 boatLeft.attach(5);

setupStuff();

Serial.begin(9600);
 Serial.println("100");
}

void setupStuff(){
 boatRight.write(180); 
 boatLeft.write(0);

pixels.begin();
 pixels.setBrightness(10);
 pixels.clear();
 pixels.show();
 
 stage = -1;

serialComm = 0;
}

void loop() {
 int green = digitalRead(ledGreen);
 int red = digitalRead(ledRed);
 int blue = digitalRead(ledBlue);
 int yellow = digitalRead(ledYellow);
 if(stage == 0){
 if(green == LOW){
 digitalWrite(tallLeft, LOW);
 }
 else if(green == HIGH){
 digitalWrite(tallLeft, HIGH);
 };
 if(red == LOW){
 digitalWrite(shortRight, LOW);
 }
 else if(red == HIGH){
 digitalWrite(shortRight, HIGH);
 };
 if(blue == LOW){
 digitalWrite(tallRight, LOW);
 }
 else if(blue == HIGH){
 digitalWrite(tallRight, HIGH);
 };
 if(yellow == LOW){
 digitalWrite(shortLeft, LOW);
 }
 else if(yellow == HIGH){
 digitalWrite(shortLeft, HIGH);
 };
 if(green == HIGH && red == HIGH && blue == HIGH && yellow == HIGH){
 serialComm = 1;
 boatRight.write(120); 
 boatLeft.write(50); 
 };
 }
 else if(stage == 1){
 if(green == LOW){
 serialComm = 2;
 digitalWrite(tallLeft, LOW);
 for(int i=0; i<9; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 for(int i=76; i<88; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 for(int i=115; i<124; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 pixels.show();
 for (int pos = 50; pos <= 120; pos ++) {
 boatLeft.write(pos); 
 boatRight.write(120 - pos);
 delay(15);
 }
 for (int pos = 120; pos <= 50; pos --) {
 boatRight.write(pos - 120);
 boatLeft.write(pos); 
 delay(15);
 }
 };
 }
 else if(stage == 2){
 if(red == LOW){
 serialComm = 3;
 digitalWrite(shortRight, LOW);
 for(int i=0; i<18; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 for(int i=63; i<88; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 for(int i=106; i<124; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 pixels.show();
 for (int pos = 50; pos <= 140; pos ++) {
 boatLeft.write(pos); 
 boatRight.write(130 - pos);
 delay(15);
 }
 for (int pos = 140; pos <= 50; pos --) {
 boatRight.write(pos - 130);
 boatLeft.write(pos); 
 delay(15);
 }
 };
 }
else if(stage == 3){
 if(blue == LOW){
 serialComm = 4;
 digitalWrite(tallRight, LOW);
 for(int i=0; i<27; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 for(int i=49; i<88; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 pixels.show();
 };
 for(int i=97; i<124; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 pixels.show();
 for (int pos = 50; pos <= 160; pos ++) {
 boatLeft.write(pos); 
 boatRight.write(160 - pos);
 delay(15);
 }
 for (int pos = 160; pos <= 50; pos --) {
 boatRight.write(pos - 160);
 boatLeft.write(pos);
 delay(15);
 }
 };
 }
else if(stage == 4){
 if(yellow == LOW){
 serialComm = 5;
 digitalWrite(shortLeft, LOW);
 for(int i=0; i<36; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 for(int i=38; i<88; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 for(int i=88; i<181; i++){
 int index = int(random(0,6))*3;
 int R = colors[index];
 int G = colors[index + 1];
 int B = colors[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 pixels.show();
 for (int pos = 50; pos <= 180; pos ++) {
 boatLeft.write(pos); 
 boatRight.write(180 - pos);
 delay(15);
 }
 for (int pos = 180; pos <= 50; pos --) {
 boatRight.write(pos - 180);
 boatLeft.write(pos);
 delay(15);
 }
 };
 }
 else if(stage == 5){
 serialComm = 6;
 for(int i=0; i<181; i++){
 int index = int(random(0,4))*3;
 int R = colorsFire[index];
 int G = colorsFire[index + 1];
 int B = colorsFire[index + 2];
 pixels.setPixelColor(i, R, G, B);
 };
 pixels.show();
 boatRight.write(180); 
 boatLeft.write(0);
 }
 else if(stage == 6){
 setupStuff();
 };
 if(Serial.available() > 0){
 
 stage = Serial.read();
 Serial.println(serialComm);
 };
}

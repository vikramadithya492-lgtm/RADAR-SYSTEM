#include <Servo.h>
// Ultrasonic sensor pins
const int trigPin = 10;
const int echoPin = 11;
// Buzzer and LED pins
const int buzzerPin = 8;
const int ledPin = 9;
long duration;
int distance;
Servo myServo;
void setup() {
pinMode(trigPin, OUTPUT);
pinMode(echoPin, INPUT);
pinMode(buzzerPin, OUTPUT);
pinMode(ledPin, OUTPUT);
Serial.begin(9600);
myServo.attach(12);
} 
void loop() {
for (int i = 15; i <= 165; i++) {
myServo.write(i);
delay(30);
distance = calculateDistance();
Serial.print(i);
Serial.print(",");
Serial.print(distance);
Serial.print(".");
checkAndAlert(distance);
}
for (int i = 165; i > 15; i--) {
myServo.write(i);
delay(30);
distance = calculateDistance();
Serial.print(i);
Serial.print(",");
Serial.print(distance); 
Serial.print(".");
checkAndAlert(distance);
}
}
int calculateDistance() {
digitalWrite(trigPin, LOW);
delayMicroseconds(2);
digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);
duration = pulseIn(echoPin, HIGH);
distance = duration * 0.034 / 2;
if (distance > 400) distance = 400;
return distance;
}
void checkAndAlert(int dist) {
if (dist < 40) {
digitalWrite(buzzerPin, HIGH);
digitalWrite(ledPin, HIGH);
delay(100); 
digitalWrite(buzzerPin, LOW);
digitalWrite(ledPin, LOW);
} else {
digitalWrite(buzzerPin, LOW);
digitalWrite(ledPin, LOW);
}
}
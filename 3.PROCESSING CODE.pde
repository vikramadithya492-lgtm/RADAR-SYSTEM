import processing.serial.*; // For serial communication
Serial myPort; // Serial port object
String angle = "";
String distance = "";
String data = "";
String noObject;
float pixsDistance;
int iAngle = 0, iDistance = 0;
int index1 = 0;
void setup() {
size(1200, 700); // Adjust to screen resolution
smooth(); 17
// Print available ports for debugging
println(Serial.list());
// Change COM5 to your actual port if needed
myPort = new Serial(this, "COM5", 9600);
myPort.bufferUntil('.'); // Read until '.' which terminates each data packet
}
void draw() {
fill(98, 245, 31); // Green color
noStroke();
fill(0, 4);
rect(0, 0, width, height - height * 0.065); // Motion blur
fill(98, 245, 31); // Green color
drawRadar();
drawLine();
drawObject();
drawText();
}
void serialEvent(Serial myPort) {
data = myPort.readStringUntil('.'); // Read until the '.' character
18
if (data != null && data.indexOf(",") > 0) {
data = data.trim(); // Remove whitespace
index1 = data.indexOf(",");
try {
angle = data.substring(0, index1);
distance = data.substring(index1 + 1);
iAngle = constrain(int(angle), 0, 180); // Protect against garbage data
iDistance = constrain(int(distance), 0, 400); // Cap distance
} catch (Exception e) {
println("Error parsing data: " + data);
}
}
}
void drawRadar() {
pushMatrix();
translate(width/2, height - height * 0.074);
noFill();
strokeWeight(2);
stroke(98, 245, 31);
arc(0, 0, width * 0.9375, width * 0.9375, PI, TWO_PI);
arc(0, 0, width * 0.73, width * 0.73, PI, TWO_PI); 19
arc(0, 0, width * 0.521, width * 0.521, PI, TWO_PI);
arc(0, 0, width * 0.313, width * 0.313, PI, TWO_PI);
for (int a = 30; a <= 150; a += 30) {
line(0, 0, (-width / 2) * cos(radians(a)), (-width / 2) * sin(radians(a)));
}
line(-width/2, 0, width/2, 0);
popMatrix();
}
void drawObject() {
pushMatrix();
translate(width/2, height - height * 0.074);
strokeWeight(9);
stroke(255, 10, 10); // Red
pixsDistance = iDistance * ((height - height * 0.1666f) * 0.025);
if (iDistance < 40) {
line(pixsDistance * cos(radians(iAngle)), -pixsDistance * sin(radians(iAngle)),
(width - width * 0.505f) * cos(radians(iAngle)), -(width - width * 0.505f) * sin(radians(iAngle)));
} 20
popMatrix();
}
void drawLine() {
pushMatrix();
strokeWeight(9);
stroke(30, 250, 60);
translate(width/2, height - height * 0.074);
line(0, 0, (height - height * 0.12f) * cos(radians(iAngle)), -(height - height * 0.12f) * sin(radians(iAngle)));
popMatrix();
}
void drawText() {
pushMatrix();
noObject = (iDistance > 40) ? "Out of Range" : "In Range";
fill(0);
noStroke();
rect(0, height - height * 0.0648f, width, height);
fill(98, 245, 31);
textSize(25);
text("10cm", width * 0.6146f, height - height * 0.0833f);
text("20cm", width * 0.719f, height - height * 0.0833f);
text("30cm", width * 0.823f, height - height * 0.0833f); 21
text("40cm", width * 0.9271f, height - height * 0.0833f);
textSize(40);
text("OBJECT DETECTION RADAR", width * 0.125, height - height * 0.0277f);
text("Angle: " + iAngle, width * 0.52f, height - height * 0.0277f);
text("Distance: " + (iDistance < 40 ? iDistance + " cm" : "Out of Range"), width * 0.74f, height - height * 0.0277f);
// Angle markings
textSize(25);
fill(98, 245, 60);
drawAngleLabel(30, "30");
drawAngleLabel(60, "60");
drawAngleLabel(90, "90");
drawAngleLabel(120, "120");
drawAngleLabel(150, "150");
// Alert Message Blinking
if (iDistance < 40 && (frameCount / 30) % 2 == 0) {
fill(255, 0, 0);
textSize(35);
textAlign(CENTER);
text("⚠ ALERT: Object Detected!", width / 2, height * 0.1f);
textAlign(LEFT); 22
}
popMatrix();
}
void drawAngleLabel(int angleDeg, String label) {
pushMatrix();
float radius = width / 2;
float x = (width - width * 0.5f) + radius * cos(radians(angleDeg));
float y = (height - height * 0.09f) - radius * sin(radians(angleDeg));
translate(x, y);
rotate(-radians(angleDeg - 90));
text(label, 0, 0);
popMatrix();
}

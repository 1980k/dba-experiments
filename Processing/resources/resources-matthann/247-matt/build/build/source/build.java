import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class build extends PApplet {

public void setup() {
  size(1000,1000, OPENGL);
  background(0);
  smooth();
}

public void draw() {
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
}

public void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  stroke(255,random(10,255));
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(250, 104, 157,random(10,100));
  translate(mouseX,mouseY);
  rotate(random(360));
  ellipse(sin(random(px*speed)),sin(random(px*speed)), random(px*speed), random(px*speed));
  bezier(random(px*speed)*20,random(py*speed), random(px*speed), random(py*speed),  random(px*speed), random(py*speed),  random(px*speed), random(py*speed)*20);

  stroke(255, random(10,100));
  strokeCap(ROUND);
  strokeJoin(ROUND);
  strokeWeight(3);
  fill(26, 0, 255,random(10,100));
  rotate(random(360));
  triangle(random(px*speed), random(py*speed), random(px*speed), random(py*speed), random(px*speed), random(py*speed));
  bezier(random(px*speed),random(py*speed), random(px*speed), random(py*speed),  random(px*speed), random(py*speed),  random(px*speed), random(py*speed));

}

public void keyPressed() {
  if (key == 's') {
    saveFrame();
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

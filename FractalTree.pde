private int smallestBranch = 10; 
private float branchAngle = 0.2;  
public void setup() 
{   
  //size(640,480);    
  size(800,800);
  noLoop(); 
  frameRate(10);
} 
public void draw() 
{   
  background(0);   
  fill(255);
  textSize(32);
  text("Click!", 350, 100);
  stroke(#FFC0CB);   
  line(400,800,400,700);   
  drawBranches(400,700,(double)100,(double)(3*Math.PI/2));
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int x1 = (int)(branchLength*Math.cos(angle1) + x);
  int y1 = (int)(branchLength*Math.sin(angle1) + y);
  int x2 = (int)(branchLength*Math.cos(angle2) + x);
  int y2 = (int)(branchLength*Math.sin(angle2) + y);
  int x3 = (int)(2*branchLength*Math.cos(angle1) + x);
  int y3 = (int)(2*branchLength*Math.sin(angle1) + y);
  int x4 = (int)(2*branchLength*Math.cos(angle2) + x);
  int y4 = (int)(2*branchLength*Math.sin(angle2) + y);
  
  if(branchLength > smallestBranch) {
    drawBranches(x1, y1, (double)branchLength / 1.25, (double)angle1 + .5);
    drawBranches(x2, y2, (double)branchLength / 1.25, (double)angle2 - .5);
  }
  stroke((int)(Math.random()*256), 0, 0);
  line(x, y, x1, y1);
  stroke(0,(int)(Math.random()*256), 0);
  line(x, y, x2, y2);
  stroke(0,0,(int)(Math.random()*256));
  line(x, y, x3, y3);
  stroke((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  line(x, y, x4, y4);
}
public void mousePressed() {
  redraw();
}

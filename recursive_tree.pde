int div = 4;
float theta = PI/div;
int count = 0;

void setup() {
  size(1000, 600);
  background(20);
}

void draw() { 
  tree();
  saveNexit();
}

void branch(float len) {
  // Pick a branching angle at random
  theta = random(0,PI/div);
  
  // Draw the branch
  line(0, 0, 0, -len);

  //Translate to the end.
  translate(0, -len);

  // Shrink branch by two-thirds
  len *= 0.66;

  if (len > 2) {
    //Rotate to the right and branch again.
    pushMatrix();
    rotate(theta);
    branch(len);
    popMatrix();
  
    // Rotate to the left and branch again.
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}

void tree() {
  translate(width/2, height);
  stroke(200, 200, 200, 10);
  branch(height * 0.3);  
}

void saveNexit() {
  count++;
  if (count > 50) {
   save("tree" + div + ".jpg");
   exit();
  }
}
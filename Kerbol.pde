
class planet {
  float vel = 0;
  float pos;
  float grv;
  float tim = 0;
  String name = "";
  color col;

  planet(float g, String n, color c) {
    grv = g;
    name = n;
    col = c;
  }
}

int[] list = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; 
ArrayList<planet> planets;
ArrayList<planet> allPlanets;

float dt = 0.025; //sim speed, higher = faster, lower = more accurate
int speedIndex = 0;
boolean mainBody = true;
boolean moons = false;
boolean custom = false;

void setup() {
  fullScreen();

  planets = new ArrayList<planet>();
  allPlanets = new ArrayList<planet>();

  reloadPlanets(list);
}


void draw() { 
  background(0);
  fill(255);
  stroke(255);
  line(0, height * 3/4, width, height * 3/4);
  line(0, height * 1/6, width, height * 1/6);
  textSize(40);
  textAlign(CENTER);
  text("1 Kilometer \"Ball Drop\" On Kerbol System Bodies", width/2, 50);

  textSize(25);
  text("0km", width * 39/40, height * 3/4 + 30);
  text("1km", width * 39/40, height * 1/6 - 20);
  text("t=", 40, height * 1/6 - 80);
  text("v=", 40, height * 1/6 - 40);
  textSize(15);
  text("By: EV4", width * 39/40, height-10);
  text("gravity at surface, objects not to scale, free-fall assuming no air resistance", width/2, height-10);

  for (int i = 0; i < planets.size(); i++) {
    fill(planets.get(i).col);
    stroke(planets.get(i).col);
    ellipse((i+1) * width/(planets.size()+1), height * 5/6, 50, 50);
    textAlign(CENTER);

    textSize(25);
    text(planets.get(i).name, (i+1) * width/(planets.size()+1), height * 5/6 + 60 );

    if (planets.get(i).pos < 1000) {
      fill(255);
    } else {
      fill(0, 255, 0);
    }
    text(nf(planets.get(i).vel, 0, 2) +" m/s", (i+1) * width/(planets.size()+1), height * 1/6 - 40 );
    text(nf(planets.get(i).tim, 0, 2) +" s", (i+1) * width/(planets.size()+1), height * 1/6 - 80 );

    fill(255);
    textSize(18);
    text("Gravity", (i+1) * width/(planets.size()+1), height * 5/6 + 100 );
    text(planets.get(i).grv + " m/s²", (i+1) * width/(planets.size()+1), height * 5/6 + 120 );    

    fill(planets.get(i).col);
    stroke(planets.get(i).col);
    ellipse((i+1) * width/(planets.size()+1), height * 1/6 + planets.get(i).pos/1000 * height * (3.0/4.0 - 1.0/6.0), 25, 25);

    
    for(int j = 0; i < 1; i++){
      //only continue calculations if body hasn't reached the bottom
      if (planets.get(i).pos < 1000) {
        planets.get(i).vel += planets.get(i).grv * dt;
        planets.get(i).tim += dt;
        planets.get(i).pos += planets.get(i).vel * dt;
  
        if (planets.get(i).pos > 1000) {
          planets.get(i).pos = 1000;
        }
      }
    }
    
  } 

  //saveFrame("Frame-####.png");
}

void keyPressed() {
  switch(key) {
  case '+':
  case '=':
    if (dt < 0.25) {
      dt *= 2;
      speedIndex += 1;
    }
    break;    
  case '-':
  case '_':
    if (dt > 0.005) {
      dt /= 2;
      speedIndex -= 1;
    }
    break;
  }
}

void reloadPlanets(int[] list) {
  allPlanets = new ArrayList<planet>();
  allPlanets.add(new planet(17.1, "Kerbol", color(255, 204, 0))); 
  allPlanets.add(new planet(2.7, "Moho", color(168, 111, 50)));    
  allPlanets.add(new planet(9.81, "Kerbin", color(0, 0, 200))); 
  allPlanets.add(new planet(1.63, "Mun", color(50, 50, 50))); 
  allPlanets.add(new planet(0.491, "Minmus", color(129, 219, 209)));     
  allPlanets.add(new planet(16.7, "Eve", color(200, 0, 200)));
  allPlanets.add(new planet(0.049, "Gilly", color(222, 192, 173))); 
  allPlanets.add(new planet(2.94, "Duna", color(150, 20, 20)));
  allPlanets.add(new planet(1.1, "Ike", color(130, 130, 130)));  
  allPlanets.add(new planet(1.13, "Dres", color(100, 100, 100)));  
  allPlanets.add(new planet(7.85, "Jool", color(20, 200, 20)));
  allPlanets.add(new planet(7.85, "Laythe", color(15, 19, 128)));
  allPlanets.add(new planet(2.31, "Vall", color(118, 165, 166)));
  allPlanets.add(new planet(7.85, "Tylo", color(209, 209, 203)));
  allPlanets.add(new planet(0.589, "Bop", color(163, 116, 95)));
  allPlanets.add(new planet(0.373, "Pol", color(186, 165, 117)));
  allPlanets.add(new planet(1.69, "Eeloo", color(220, 220, 220)));

  planets = new ArrayList<planet>();
  if (mainBody) {
    planets.add(new planet(17.1, "Kerbol", color(255, 204, 0))); 
    planets.add(new planet(2.7, "Moho", color(168, 111, 50)));  
    planets.add(new planet(9.81, "Kerbin", color(0, 0, 200))); 
    planets.add(new planet(16.7, "Eve", color(200, 0, 200)));
    planets.add(new planet(2.94, "Duna", color(150, 20, 20)));  
    planets.add(new planet(1.13, "Dres", color(100, 100, 100)));  
    planets.add(new planet(7.85, "Jool", color(20, 200, 20))); 
    planets.add(new planet(1.69, "Eeloo", color(220, 220, 220)));
  }
  if (moons) {
    planets.add(new planet(1.63, "Mun", color(50, 50, 50))); 
    planets.add(new planet(0.491, "Minmus", color(129, 219, 209)));
    planets.add(new planet(0.049, "Gilly", color(222, 192, 173))); 
    planets.add(new planet(1.1, "Ike", color(130, 130, 130))); 
    planets.add(new planet(7.85, "Laythe", color(15, 19, 128)));
    planets.add(new planet(2.31, "Vall", color(118, 165, 166)));
    planets.add(new planet(7.85, "Tylo", color(209, 209, 203)));
    planets.add(new planet(0.589, "Bop", color(163, 116, 95)));
    planets.add(new planet(0.373, "Pol", color(186, 165, 117)));
  }
  if (custom) {
    for(int i = 0; i < allPlanets.size(); i++){
      if(list[i] == 1){
        planets.add(allPlanets.get(i));
      }
    } 
    
    
  }
}

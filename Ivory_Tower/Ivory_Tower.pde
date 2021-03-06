/* Ivory Tower
* Test of financial API. 
* Experiment by artist Ben Aron */

import http.requests.*;
//Communicate w/ API
String url = "https://www.quandl.com/api/v3/datasets/WIKI/DV/data.json?start_date=2015-05-27&end_date=2015-05-27";
int imageW = 290;
int imageH = 500;
int scaleInt = 0;
int counter = 0;
int[] testPrices = {31, 32, 40, 21, 25, 50};
int testPrice= 0;
int time = 0;
int lastTime = 0;

PImage devry;

void setup() { 
  size(800, 800);
}

void draw() {
  devry = loadImage("devry.jpg");
  time = millis();
  if(time - lastTime > 1000) { 
   counter ++; 
   lastTime = millis();
  }
  if(counter >= 5) { 
        noLoop(); 
     }
  testPrice = testPrices[counter];
  println(counter);
  
  background(255);
  
  //float scaleAmount = findPrice() / 100;
  float scaleAmount = testPrice / 100.00;
  scaleInt = (int) scaleAmount;
  
  devry.resize((int)(imageW * scaleAmount), (int)(imageH * scaleAmount));
  image(devry, 0,0);
}

float findPrice() {  
  //Grab information
  GetRequest web = new GetRequest(url);
  web.send();
  String rawContent = web.getContent();
  
  String grabData = rawContent.split("\\[\\[")[1];
  String cutEnd = grabData.split("\\]\\]")[0];
  String closePrice = cutEnd.split(",")[4];
  float closeFloat = Float.valueOf(closePrice);
  return closeFloat;
}
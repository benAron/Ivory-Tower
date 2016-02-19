/* Ivory Tower
* Test of financial API. 
* Experiment by artist Ben Aron */

import http.requests.*;
String url = "https://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.json?end_date=2015-05-27";
String price = "";

void setup() { 
  size(800, 500);
}

void draw() { 
  println(findPrice());
  delay(1000);
  noLoop();
}

String findPrice() { 
  
  //Grab information
  GetRequest web = new GetRequest(url);
  web.send();
  String rawContent = web.getContent();

  /*Parse
  String[] cutOne = rawContent.split("</LastPrice>");
  String firstHalf = cutOne[0];
  String[] cutTwo = firstHalf.split("<LastPrice>");
  price = cutTwo[1];
  return price;
  */
  return rawContent;
}
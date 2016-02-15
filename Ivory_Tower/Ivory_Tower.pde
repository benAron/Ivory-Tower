/* Ivory Tower
* Test of financial API. 
* Experiment by artist Ben Aron */

import http.requests.*;
String url =  
String price = "";

void setup() { 
  size(800, 500);
}

void draw() { 
  println(findPrice("AAPL"));
  delay(1000);
  
}

String findPrice(String symbol) { 
  
  //Grab information
  GetRequest web = new GetRequest(url+ "?symbol=" + symbol);
  web.send();
  String rawContent = web.getContent();

  //Parse
  String[] cutOne = rawContent.split("</LastPrice>");
  String firstHalf = cutOne[0];
  String[] cutTwo = firstHalf.split("<LastPrice>");
  price = cutTwo[1];
  return price;
}
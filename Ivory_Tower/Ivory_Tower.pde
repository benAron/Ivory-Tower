/* Ivory Tower
* Test of financial API. 
* Experiment by artist Ben Aron */

import http.requests.*;
<<<<<<< HEAD
String url =  
String price = "";

void setup() { 
  size(800, 500);
=======
  String url = "https://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.json?end_date=2015-05-27";
  
  
  String price = "";


void setup() { 
  size(800, 500);
  
  GetRequest getR = new GetRequest(url);
  getR.send();
  rawContent = getR.getContent();
>>>>>>> fee84b7d3f6599601b7c166345a1904af512af39
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
<<<<<<< HEAD
  return price;
}
=======

}
>>>>>>> fee84b7d3f6599601b7c166345a1904af512af39

/* Ivory Tower
* Test of financial API. 
* Experiment by artist Ben Aron */

import http.requests.*;
  String url = "http://dev.markitondemand.com/Api/v2/Quote";
  
  
  String price = "";


void setup() { 
  size(800, 500);
  
  GetRequest getR = new GetRequest(url+ "?symbol=" + company);
  getR.send();
  rawContent = getR.getContent();
}

void draw() { 
  
  
}

void findPrice(String symbol) { 
  
  //Grab information
  GetRequest web = new GetRequest(url+ "?symbol=" + symbol);
  web.send();
  String rawContent = web.getContent();

  //Parse
  String[] cutOne = rawContent.split("</LastPrice>");
  String firstHalf = cutOne[0];
  String[] cutTwo = firstHalf.split("<LastPrice>");
  price = cutTwo[1];

}
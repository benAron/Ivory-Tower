/* Ivory Tower
* Test of financial API. 
* Experiment by artist Ben Aron */

import http.requests.*;
  String url = "https://www.quandl.com/api/v3/datasets/WIKI/AAPL/data.json?end_date=2015-05-27";
  
  
  String price = "";


void setup() { 
  size(800, 500);
  
  GetRequest getR = new GetRequest(url);
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

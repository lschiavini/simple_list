class Stock {
  String symbol;
  String company;
  String price;
  String chg;

  Stock({
    required this.symbol, 
    required this.company, 
    required this.price, 
    required this.chg
  });
  

  static List<Stock> getStocks() {
    List<Stock> stocks = <Stock>[];
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));
    stocks.add(
        Stock(symbol: "GOOG", company: "Google", price: "220", chg: "11"));

    return stocks;
  }
}

import 'dart:math';

class Stock {
  String symbol;
  String company;
  String price;
  String chg;

  Stock(
      {required this.symbol,
      required this.company,
      required this.price,
      required this.chg});

  static Stock emptyStock() {
    return Stock(symbol: "", company: "", price: "", chg: "");
  }

  static Stock generateRandomStock(
      {required String receivedSymbol, required String receivedCompany}) {
    Random random = Random();
    int randomPrice = random.nextInt(300);
    int randomPercentage = random.nextInt(200) - 100;
    Stock randomStock = Stock(
        symbol: receivedSymbol,
        company: receivedCompany,
        price: randomPrice.toString(),
        chg: "$randomPercentage");

    return randomStock;
  }

  static List<Stock> getStocks() {
    List<Stock> stocks = <Stock>[];
    stocks.add(generateRandomStock(
        receivedSymbol: "MGLU3", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "PETR4", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "AMZN34", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "BIDI4", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "VALE3", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "MGLU34", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "PETR44", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "AMZN345", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "BIDI45", receivedCompany: "Google"));
    stocks.add(generateRandomStock(
        receivedSymbol: "VALE35", receivedCompany: "Google"));
    return stocks;
  }
}

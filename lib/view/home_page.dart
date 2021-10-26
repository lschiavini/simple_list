import 'package:flutter/material.dart';
import 'package:simple_list/model/stock.dart';
import 'package:simple_list/view/stock_list.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AppState();
    throw "Error";
  }
}

class AppState extends StatefulWidget {
  const AppState({Key? key}) : super(key: key);
  @override
  MyHomePage createState() => MyHomePage(title: "WatchList");
}

class MyHomePage extends State<AppState> {
  Timer? timer;
  List<Stock>? stocks = <Stock>[];

  final StreamController<List<Stock>> _currentStreamCtrl =
      StreamController<List<Stock>>.broadcast();

  // final Stream<List<Stock>> stocks = (() async* {
  //   await Future<void>.delayed(const Duration(seconds: 1));
  //   yield Stock.getStocks();
  //   ;
  //   await Future<void>.delayed(const Duration(seconds: 1));
  // })();

  Stream<List<Stock>> get onCurrentStockChanged => _currentStreamCtrl.stream;
  void updateStocks() => _currentStreamCtrl.sink.add(Stock.getStocks());

  final title;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(milliseconds: 100), (Timer t) => updateStocks());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Watch List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height - 49,
                      child: StreamBuilder<List<Stock>>(
                          stream: onCurrentStockChanged,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Stock>> snapshot) {
                            Widget children;
                            if (snapshot.hasError) {
                              children = StockList(stocks: Stock.getStocks());
                            } else {
                              children = StockList(
                                stocks: snapshot.data,
                              );
                            }
                            return children;
                          })))
            ],
          ),
        ),
      )
    ]));
  }
}

import 'package:flutter/material.dart';
import 'package:simple_list/model/stock.dart';

class StockList extends StatelessWidget {
  List<Stock>? stocks;

  StockList({required this.stocks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
          height: 0,
          thickness: 1,
        );
      },
      itemCount: stocks!.length,
      itemBuilder: (context, index) {
        final Stock stock =
            stocks!.isNotEmpty ? stocks![index] : Stock.emptyStock();
        bool isChgNegative = true;

        if (double.parse(stock.chg) > 0) {
          isChgNegative = false;
        }

        return ListTile(
          contentPadding: const EdgeInsets.all(1),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(stock.symbol,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                Text(stock.company,
                    style: const TextStyle(color: Colors.white, fontSize: 12))
              ]),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "\$${stock.price}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                alignment: Alignment.center,
                width: 75,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isChgNegative ? Colors.red : Colors.green),
                child: Text(
                  "${stock.chg}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

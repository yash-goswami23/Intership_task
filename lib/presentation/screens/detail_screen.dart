import 'package:flutter/material.dart';
import 'package:my_portfolio/domain/entities/investment.dart';

import '../widgets/component/item_card.dart';

class DetailScreen extends StatelessWidget {
  final Investment investment;
  const DetailScreen({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          itemCard(
                              "Investment Name: ", investment.investmentName),
                          itemCard("Amount Invested: ",
                              investment.amountInvestment.toString()),
                          itemCard("Current Amount: ",
                              investment.currentValue.toString()),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: itemCard("Percentage Growth: ",
                        investment.percentageGrowth.toStringAsFixed(2)),
                  )
                ])));
  }
}

import 'package:flutter/material.dart';
import 'package:my_portfolio/domain/entities/investment.dart';
import 'package:my_portfolio/presentation/screens/add_investment_screen.dart';
import 'package:my_portfolio/presentation/screens/chart_screen.dart';
import 'package:my_portfolio/presentation/screens/detail_screen.dart';
import 'package:my_portfolio/presentation/state/investment_provider.dart';
import 'package:my_portfolio/presentation/widgets/component/item_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Investment> forChart = [];
    return Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        IconButton(
            onPressed: () {
              if (forChart.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartScreen(list: forChart),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Add Some Investment")));
              }
            },
            icon: const Icon(Icons.pie_chart))
      ]),
      body: Consumer<InvestmentProvider>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: value.showInvestment(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                      child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ));
                case ConnectionState.done:
                  if (snapshot.data!.isEmpty) {
                    return const Center(child: Text("Add Some Investment"));
                  } else {
                    forChart = snapshot.data!;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          investment: snapshot.data![index],
                                        ),
                                      ));
                                },
                                child: Column(
                                  children: [
                                    Card(
                                      child: Column(
                                        children: [
                                          itemCard(
                                              "Investment Name:",
                                              snapshot
                                                  .data![index].investmentName),
                                          itemCard("Invest Amount:",
                                              "${snapshot.data![index].amountInvestment}"),
                                          itemCard("Current Value:",
                                              "${snapshot.data![index].currentValue}")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: itemCard("Total Portfolio Value: ",
                                value.totalValue.toStringAsFixed(2)),
                          ),
                        )
                      ],
                    );
                  }
                default:
                  return const Center(child: Text("Something Wrong"));
              }
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddInvestmentScreen(),
                ));
          },
          tooltip: "Add Investment",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

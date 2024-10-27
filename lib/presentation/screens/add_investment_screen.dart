import 'package:flutter/material.dart';
import 'package:my_portfolio/domain/entities/investment.dart';
import 'package:my_portfolio/presentation/state/investment_provider.dart';
import 'package:provider/provider.dart';

class AddInvestmentScreen extends StatelessWidget {
  const AddInvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
    TextEditingController investNameController = TextEditingController();
    TextEditingController investAmountController = TextEditingController();
    TextEditingController investcurrentAmountController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Investment"),
      ),
      body: Form(
        key: fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: investNameController,
                decoration: InputDecoration(
                  labelText: "Investment Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Investment Name";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: investAmountController,
                decoration: InputDecoration(
                  labelText: "Invested Amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Amount Invested (in USD)";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: investcurrentAmountController,
                decoration: InputDecoration(
                  labelText: "Current Amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Current Amount (in USD)";
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    double currentValue =
                        double.parse(investcurrentAmountController.text);
                    double amountInvestment =
                        double.parse(investAmountController.text);

                    double percentageGrowth =
                        (currentValue - amountInvestment) /
                            amountInvestment *
                            100;

                    Investment item = Investment(
                        investmentName: investNameController.text,
                        currentValue: currentValue,
                        amountInvestment: amountInvestment,
                        percentageGrowth: percentageGrowth);

                    context.read<InvestmentProvider>().saveInvestmnet(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("successful")));
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add Investment"))
          ],
        ),
      ),
    );
  }
}

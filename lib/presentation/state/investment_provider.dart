import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_portfolio/domain/entities/investment.dart';
import 'package:my_portfolio/domain/use_cases/add_investment_use_case.dart';
import 'package:my_portfolio/domain/use_cases/show_investment_use_case.dart';

class InvestmentProvider extends ChangeNotifier {
  List<Investment> _investments = [];
  List<Investment> get investments => _investments;
  double totalValue = 0;

  void saveInvestmnet(Investment investment) async {
    await AddInvestmentUseCase().addInvestment(investment);
    notifyListeners();
  }

  Future<List<Investment>> showInvestment() async {
    _investments = await ShowInvestmentUseCase().showInvestment().then(
      (value) {
        return Future.delayed(const Duration(seconds: 1), () {
          return value;
        });
      },
    );
    if (_investments.isNotEmpty) {
      totalValue = 0;
      for (var element in _investments) {
        totalValue = totalValue + element.amountInvestment;
      }
    }
    return _investments;
  }
}

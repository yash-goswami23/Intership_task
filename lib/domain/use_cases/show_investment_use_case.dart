import 'package:my_portfolio/data/models/investment.dart';
import 'package:my_portfolio/domain/entities/investment.dart';

import '../../data/repositories/investment_repository.dart';

class ShowInvestmentUseCase {
  final InvestmentRepository _investmentRepository = InvestmentRepository();
  Future<List<Investment>> showInvestment() async {
    List<String>? investItems = await _investmentRepository.showInvestment();
    List<Investment> investmentItems = [];

    if (investItems != null) {
      List<InvestmentModel> investmentModels = [];
      for (var element in investItems) {
        investmentModels.add(InvestmentModel.fromJson(element));
      }
      investmentItems.clear();
      for (var element in investmentModels) {
        investmentItems.add(Investment(
            investmentName: element.investmentName,
            currentValue: element.currentValue,
            amountInvestment: element.amountInvestment,
            percentageGrowth: element.percentageGrowth));
      }
    }
    return investmentItems;
  }
}

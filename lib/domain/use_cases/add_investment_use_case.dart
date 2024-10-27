import 'package:my_portfolio/data/models/investment.dart';
import 'package:my_portfolio/data/repositories/investment_repository.dart';
import 'package:my_portfolio/domain/entities/investment.dart';

class AddInvestmentUseCase {
  final InvestmentRepository _investmentRepository = InvestmentRepository();
  Future<bool> addInvestment(Investment investment) {
    InvestmentModel investmentItem = InvestmentModel(
        investmentName: investment.investmentName,
        currentValue: investment.currentValue,
        amountInvestment: investment.amountInvestment,
        percentageGrowth: investment.percentageGrowth);
    return _investmentRepository.saveInvestment(investmentItem);
  }
}

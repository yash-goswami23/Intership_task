import 'package:my_portfolio/data/data_source/local_database.dart';
import 'package:my_portfolio/data/models/investment.dart';

class InvestmentRepository {
  LocalDatabase localDB = LocalDatabase.instance;

  Future<bool> saveInvestment(InvestmentModel investment) {
    return localDB.saveInvestment(investment);
  }

  Future<List<String>?> showInvestment() {
    return localDB.readInvestment();
  }
}

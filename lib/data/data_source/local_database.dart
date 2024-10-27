import 'package:my_portfolio/data/models/investment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._instance();
  static SharedPreferences? _prefs;

  final String items = "ITEMS";
  List<String> investmentItemList = [];
  LocalDatabase._instance();

  Future<SharedPreferences> get prefs async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  //save
  Future<bool> saveInvestment(InvestmentModel value) async {
    SharedPreferences prefs = await instance.prefs;
    investmentItemList.add(value.toJson());
    return await prefs.setStringList(items, investmentItemList);
  }

  //read
  Future<List<String>?> readInvestment() async {
    SharedPreferences prefs = await instance.prefs;
    if (prefs.getStringList(items) != null) {
      investmentItemList = prefs.getStringList(items)!;
    }
    return prefs.getStringList(items);
  }
}

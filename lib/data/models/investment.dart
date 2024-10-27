import 'dart:convert';

import 'package:equatable/equatable.dart';

class InvestmentModel extends Equatable {
  final String investmentName;
  final double currentValue;
  final double amountInvestment;
  final double percentageGrowth;
  const InvestmentModel({
    required this.investmentName,
    required this.currentValue,
    required this.amountInvestment,
    this.percentageGrowth = 0,
  });

  InvestmentModel copyWith({
    String? investmentName,
    double? currentValue,
    double? amountInvestment,
    double? percentageGrowth,
  }) {
    return InvestmentModel(
      investmentName: investmentName ?? this.investmentName,
      currentValue: currentValue ?? this.currentValue,
      amountInvestment: amountInvestment ?? this.amountInvestment,
      percentageGrowth: percentageGrowth ?? this.percentageGrowth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'investmentName': investmentName,
      'currentValue': currentValue,
      'amountInvestment': amountInvestment,
      'percentageGrowth': percentageGrowth,
    };
  }

  factory InvestmentModel.fromMap(Map<String, dynamic> map) {
    return InvestmentModel(
      investmentName: map['investmentName'] as String,
      currentValue: map['currentValue'] as double,
      amountInvestment: map['amountInvestment'] as double,
      percentageGrowth: map['percentageGrowth'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory InvestmentModel.fromJson(String source) =>
      InvestmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [investmentName, currentValue, amountInvestment, percentageGrowth];
}

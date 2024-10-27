class Investment {
  final String investmentName;
  final double currentValue;
  final double amountInvestment;
  final double percentageGrowth;
  const Investment({
    required this.investmentName,
    required this.currentValue,
    required this.amountInvestment,
    this.percentageGrowth = 0,
  });
}

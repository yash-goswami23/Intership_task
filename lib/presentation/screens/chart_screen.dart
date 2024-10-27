import 'package:flutter/material.dart';
import 'package:my_portfolio/domain/entities/investment.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatelessWidget {
  final List<Investment> list;
  const ChartScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Investment chart'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: SfCircularChart(
              margin: const EdgeInsets.all(0),
              series: [
                PieSeries(
                  dataSource: list,
                  yValueMapper: (datam, index) => list[index].currentValue,
                  xValueMapper: (datam, index) => list[index].investmentName,
                  radius: '60%',
                  explode: true,
                  dataLabelMapper: (datam, i) =>
                      list[i].currentValue.toString(),
                  dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside,
                    textStyle: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                orientation: LegendItemOrientation.vertical,
                iconHeight: 20,
                iconWidth: 20,
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
            )));
  }
}

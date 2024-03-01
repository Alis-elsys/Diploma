import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/nav_bar.dart';


class StatisticPageWidget extends StatefulWidget {
  const StatisticPageWidget({Key? key}) : super(key: key);
  final int Sold = 1;
  final int Bought = 3;


  @override
  State<StatisticPageWidget> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Statistic',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pie chart representing all of your sold and bought NFTs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SfCircularChart(
              legend: Legend(isVisible: true),
              series: <CircularSeries>[
            // Render pie chart
               PieSeries<CircularChartSampleData, String>(
                dataSource: <CircularChartSampleData>[
                  CircularChartSampleData('Sold NFTs', widget.Sold),
                  CircularChartSampleData('Bought NFTs', widget.Bought),
                ],
                xValueMapper: (CircularChartSampleData data, _) => data.x,
                yValueMapper: (CircularChartSampleData data, _) => data.y,
                dataLabelSettings: DataLabelSettings(isVisible: true),
               ),
             ],
            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),

    );
  }
}

class CircularChartSampleData {
  CircularChartSampleData(this.x, this.y);
  final String x;
  final int y;
}
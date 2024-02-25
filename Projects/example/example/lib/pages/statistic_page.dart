import 'package:flutter/material.dart';


class StatisticPageWidget extends StatefulWidget {
  const StatisticPageWidget({Key? key}) : super(key: key);

  @override
  State<StatisticPageWidget> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
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
            const Text(
              'Statistic',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'This is the Statistic page',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

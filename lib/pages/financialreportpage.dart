import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancialReportPage extends StatelessWidget {

  static const String route = '/financialreportpage';
  const FinancialReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Report'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: 'Month',
              items: ['Month', 'Week', 'Year']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 5120,
                      color: Colors.orange,
                      title: '',
                    ),
                    PieChartSectionData(
                      value: 1280,
                      color: Colors.purple,
                      title: '',
                    ),
                    PieChartSectionData(
                      value: 532,
                      color: Colors.red,
                      title: '',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '9400.0',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ToggleButtons(
              isSelected: [true, false],
              onPressed: (index) {},
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Expense'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Income'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ExpenseItem(name: 'Shopping', amount: 5120, color: Colors.orange),
            ExpenseItem(name: 'Subscription', amount: 1280, color: Colors.purple),
            ExpenseItem(name: 'Food', amount: 532, color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final String name;
  final double amount;
  final Color color;

  const ExpenseItem({
    required this.name,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 8,
          ),
          SizedBox(width: 8),
          Text(name),
          Spacer(),
          Text(
            '- $amount',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
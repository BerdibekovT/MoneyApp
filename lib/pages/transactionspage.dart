import 'package:flutter/material.dart';


class TransactionsPage extends StatelessWidget {

  static const String route = '/transactionspage';
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              // Handle the selection
            },
            itemBuilder: (BuildContext context) {
              return {'Month', 'All', 'Shopping'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TransactionItem(
            category: 'Shopping',
            amount: -5120,
            description: 'Buy some grocery',
            time: '10:00AM',
          ),
          TransactionItem(
            category: 'Food',
            amount: -532,
            description: 'ArabianHut',
            time: '07:30PM',
          ),
          TransactionItem(
            category: 'Salary',
            amount: 5000,
            description: 'Salary for August',
            time: '04:30PM',
          ),
          TransactionItem(
            category: 'Subscription',
            amount: -1180,
            description: 'Disney+ Annual..',
            time: '03:30PM',
          ),
          TransactionItem(
            category: 'Fuel',
            amount: -1032,
            description: 'Kozhikode',
            time: '07:30PM',
          ),
          TransactionItem(
            category: 'Cinema',
            amount: -532,
            description: 'Lulu Mall',
            time: '07:30PM',
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String category;
  final int amount;
  final String description;
  final String time;

  TransactionItem({
    required this.category,
    required this.amount,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(
          _getIconForCategory(category),
          color: _getColorForCategory(category),
        ),
        title: Text(description),
        subtitle: Text(time),
        trailing: Text(
          '${amount >= 0 ? '+' : ''}$amount',
          style: TextStyle(
            color: amount >= 0 ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Shopping':
        return Icons.shopping_cart;
      case 'Food':
        return Icons.restaurant;
      case 'Salary':
        return Icons.attach_money;
      case 'Subscription':
        return Icons.subscriptions;
      case 'Fuel':
        return Icons.local_gas_station;
      case 'Cinema':
        return Icons.movie;
      default:
        return Icons.money_off;
    }
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Shopping':
        return Colors.orange;
      case 'Food':
        return Colors.red;
      case 'Salary':
        return Colors.green;
      case 'Subscription':
        return Colors.blue;
      case 'Fuel':
        return Colors.purple;
      case 'Cinema':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
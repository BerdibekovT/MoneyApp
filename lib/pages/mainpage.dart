import 'package:flutter/material.dart';




class MainPage extends StatelessWidget {

  static const String route = '/mainpage';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text('${now.day}, ${now.month} & ${now.weekday}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ALFAIZ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Account Balance',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Text(
                '\$9400.00',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Income',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '\$25000',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Expenses',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '\$11200',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Today'),
                  Text('Week'),
                  Text('Month'),
                  Text('Year'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Recent Transaction',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text('Income'),
                subtitle: Text('\$15000'),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text('Food'),
                subtitle: Text('\$6500'),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text('Income'),
                subtitle: Text('\$2800'),
                trailing: Icon(Icons.arrow_forward),
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to view all transactions
                  },
                  child: Text('View All'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
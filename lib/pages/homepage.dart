import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moneyapp/pages/addtransactionpage.dart';
import 'package:moneyapp/pages/financialreportpage.dart';
import 'package:moneyapp/pages/mainpage.dart';
import 'package:moneyapp/pages/transactionspage.dart';
import 'package:pocketbase/pocketbase.dart';
// import 'package:sup/pages/carspage.dart';
// import 'package:sup/pages/columnrow.dart';
// import 'package:sup/pages/settingspage.dart';
// import 'package:sup/pages/newspage.dart';
// import 'package:sup/pages/widget.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> createUser()async{
    final pb = PocketBase('https://book-shop.fly.dev');
    const data = {
    "username": "test_username",
    "email": "test@example.com",
    "emailVisibility": true,
    "password": "12345678",
    "passwordConfirm": "12345678",
    "role": "User"
};

var record = await pb.collection('users').create(body:data);
print(record);
  }
  int currentIndex = 0;
  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('${TransactionsPage.route}');
        break;
      case 2:
        context.go('${AddTransactionPage.route}');
        break;
      case 3:
        context.go('${FinancialReportPage.route}');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: widget.child,
      floatingActionButton: FloatingActionButton(onPressed: ()=>createUser()),
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: changeTab,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.house), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.line_axis), label: 'Transactions'),
            NavigationDestination(icon: Icon(Icons.plus_one), label: 'Add Transaction'),
            NavigationDestination(icon: Icon(Icons.pie_chart), label: 'Report',),
          ]),
    );
  }
}
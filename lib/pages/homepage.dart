import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moneyapp/pages/addtransactionpage.dart';
import 'package:moneyapp/pages/mainpage.dart';
import 'package:moneyapp/pages/transactionspage.dart';
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
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: changeTab,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.house), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.line_axis), label: 'Transactions'),
            NavigationDestination(icon: Icon(Icons.plus_one), label: 'Add Transaction'),
          ]),
    );
  }
}
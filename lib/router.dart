import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moneyapp/pages/mainpage.dart';
import 'package:moneyapp/pages/transactionspage.dart';
// import 'package:sup/pages/carspage.dart';
// import 'package:sup/pages/columnrow.dart';
// import 'package:sup/pages/newspage.dart';
// import 'package:sup/pages/settingspage.dart';
// import 'package:sup/pages/widget.dart';

import 'pages/homepage.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

Page<void> noTransitionPageBuilder(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child; // No animation
    },
  );
}

final router = GoRouter(navigatorKey: _parentKey, routes: [
  ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) => HomePage(
            child: child,
          ),
      routes: [
        GoRoute(
          path: '/',
          name: 'mainpage',
          parentNavigatorKey: _shellKey,
          pageBuilder: (context, state) => noTransitionPageBuilder(
            context,
            state,
            const MainPage(),
          ),
        ),
        GoRoute(
          path: TransactionsPage.route,
          parentNavigatorKey: _shellKey,
          name: 'Transactions',
          pageBuilder: (context, state) =>
              noTransitionPageBuilder(context, state, const TransactionsPage()),
        ),
        // GoRoute(
        //   path: ColumnRow.route,
        //   parentNavigatorKey: _shellKey,
        //   name: 'columns',
        //   pageBuilder: (context, state) =>
        //       noTransitionPageBuilder(context, state, const ColumnRow()),
        // ),
        // GoRoute(
        //   path: CarsPage.route,
        //   parentNavigatorKey: _shellKey,
        //   name: "carspage",
        //   pageBuilder: (context, state) =>
        //       noTransitionPageBuilder(context, state, const CarsPage()),
        // ),
        // GoRoute(
        //   path: CardWidget.route,
        //   parentNavigatorKey: _shellKey,
        //   name: "Mywidget",
        //   pageBuilder: (context, state) => 
        //       noTransitionPageBuilder(context, state, const CardWidget()),
        // )
      ]),
]);
import 'package:basalt_stock_market/state/provider.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';


class StateManagementClass extends StatelessWidget {
  const StateManagementClass({
    required this.child,
    Key? key,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>BaicUtilProvider()),
    StreamProvider<InternetConnectionStatus>(
    initialData: InternetConnectionStatus.connected,
    create: (_) {
    return InternetConnectionChecker().onStatusChange;
    },
    )
      ],
      child: child,
    );
  }
}

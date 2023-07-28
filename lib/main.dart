import 'package:basalt_stock_market/state/state_class.dart';
import 'package:basalt_stock_market/theme/custom_theme.dart';
import 'package:basalt_stock_market/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StateManagementClass(
      child: MaterialApp(
          title: 'Basalt Stock Market App',
          theme:CustomTheme.lightTheme,
          home: HomePage(title: "Listed Companies")),
    );
  }
}


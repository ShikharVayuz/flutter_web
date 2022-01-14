import 'package:flutter/material.dart';
import 'package:flutter_web/ThemeData/theme_data.dart';
import 'package:flutter_web/home_page.dart';
import 'package:flutter_web/routes.dart';
import 'package:flutter_web/view_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: VlccThemeData.lightTheme(context),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        Routes.viewdetails: (context) => const InvoiceListing(),
      },
    );
  }
}

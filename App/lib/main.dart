
import 'package:flutter/material.dart';
import 'package:app/routes.dart';
import 'package:app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KOX',
      theme: theme(),
      initialRoute: '/home',
      routes: routes,
    );
  }
}

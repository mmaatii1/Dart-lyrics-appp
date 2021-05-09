import 'package:flutter/material.dart';
import 'package:app/pages/home_page/body1.dart';
import 'package:app/pages/results_page/tracksresults.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body1(),
    );
  }
}

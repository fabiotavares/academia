import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  static String routeName = '/';

  const HomePage({this.title, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}

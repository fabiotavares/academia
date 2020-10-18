import 'package:flutter/material.dart';

class ListasPage extends StatelessWidget {
  static String routerName = '/listasPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Texto 1'),
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Expanded(
              flex: 2,
              child: Text('Texto 2'),
            ),
            Expanded(
              flex: 1,
              child: Text('Texto 3'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modulo9/app/pages/page1.dart';
import 'package:modulo9/app/pages/page2.dart';
import 'package:modulo9/app/pages/page3.dart';

class NavegacaoPage extends StatelessWidget {
  static String routerName = '/navegacaoPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navegação Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Page1'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Page1.routerName, arguments: 'Fábio Tavares 1');
              },
            ),
            RaisedButton(
              child: Text('Page2'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Page2.routerName, arguments: 'Fábio Tavares 2');
              },
            ),
            RaisedButton(
              child: Text('Page3'),
              onPressed: () async {
                // Navigator.of(context)
                //     .pushNamed(Page3.routerName, arguments: 'Fábio Tavares 3')
                //     .then((value) => print(value));

                int id = await Navigator.of(context).pushNamed(Page3.routerName,
                    arguments: 'Fábio Tavares 3') as int;

                print('O id retornado foi: ${id?.toStringAsFixed(2) ?? 0}');
              },
            ),
          ],
        ),
      ),
    );
  }
}

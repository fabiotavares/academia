import 'package:flutter/material.dart';

class TextosBotoesPage extends StatelessWidget {
  static String routerName = '/textosBotoes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Textos e Botões',
          // style: TextStyle(fontSize: 20),
          // textScaleFactor: ScreenUtil().scaleText,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
                quarterTurns: -1,
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.red,
                  child: Text('Fábio Tavares', style: TextStyle(fontSize: 20)),
                )),
            FlatButton(
              onPressed: () {},
              child: Text('FlatButton'),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('RaisedButton'),
            ),
            RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.alarm),
                label: Text('RaisedButton.icon')),
            InkWell(
              child: Text('InkWell'),
              onTap: () {},
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text('GestureDetector'),
              ),
              onTap: () {},
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 300,
                height: 100,
                child: Center(
                  child: Text(
                    'Botão Com Gradiente',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(0, 5))],
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.green,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

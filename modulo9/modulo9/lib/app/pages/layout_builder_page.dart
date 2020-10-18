import 'package:flutter/material.dart';

class LayoutBuilderPage extends StatelessWidget {
  static String routerName = '/layoutBuilderPage';

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Media Query'),
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.amber,
            ),
            Expanded(
              child: Container(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Column(
                      children: [
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 2,
                          color: Colors.blue,
                          child: Text('Tamanho da tela'),
                        ),
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight / 2,
                          color: Colors.green,
                          child: Text('Altura da tela'),
                        )
                        // Text('Teste'),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

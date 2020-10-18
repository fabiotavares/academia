import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaqueryPage extends StatelessWidget {
  static String routerName = '/mediaQuery';

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Media Query'),
    );
    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () {
            // Navigator.of(context).pushReplacementNamed(HomePage.routerName),
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          }),
      body: Container(
        // width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Column(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height -
              //     appBar.preferredSize.height -
              //     MediaQuery.of(context).padding.top,
              width: ScreenUtil().screenWidth,
              height: (ScreenUtil().screenHeight -
                      ScreenUtil().statusBarHeight -
                      appBar.preferredSize.height) *
                  .5,
              color: Colors.blue,
              child: Text(
                'Tamanho da tela',
                style: TextStyle(fontSize: 100),
                // importante para manter o texto igual em dif. aparelhos
                textScaleFactor: ScreenUtil().scaleText,
              ),
            ),
            Container(
              width: ScreenUtil().screenWidth,
              height: (ScreenUtil().screenHeight -
                      ScreenUtil().statusBarHeight -
                      appBar.preferredSize.height) *
                  .5,
              color: Colors.green,
              child: Text(
                  'Altura da tela: ${MediaQuery.of(context).size.height} - ${ScreenUtil().screenHeight}'),
            )
            // Text('Teste'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScrollListPage extends StatelessWidget {
  static String routerName = '/scroolListPage';

  @override
  Widget build(BuildContext context) {
    var list = List.generate(
        100,
        (index) => Container(
              width: ScreenUtil().screenWidth,
              height: 50,
              margin: EdgeInsets.all(4),
              color: Colors.amber,
              child: Text('Item #$index'),
            ));

    var list2 = List.generate(
        100,
        (index) => Container(
              width: ScreenUtil().screenWidth,
              height: 50,
              child: Text('Item #$index'),
            ));

    var list3 = List.generate(
        100,
        (index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/paisagem.jpg'),
              ),
              title: Text('Item #$index'),
              subtitle: Text('Valor xxx'),
            ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Scrool List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      100,
                      (index) => Container(
                            width: ScreenUtil().screenWidth,
                            height: 50,
                            margin: EdgeInsets.all(4),
                            color: Colors.red,
                            child: Text('Item #$index'),
                          )),
                ),
              ),
            ),
            Container(height: 50, color: Colors.black),
            Container(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      100,
                      (index) => Container(
                            width: 100,
                            height: 50,
                            margin: EdgeInsets.all(4),
                            color: Colors.red,
                            child: Text('Item #$index'),
                          )),
                ),
              ),
            ),
            Container(height: 50, color: Colors.black),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    100,
                    (index) => Container(
                          width: ScreenUtil().screenWidth,
                          height: 50,
                          margin: EdgeInsets.all(4),
                          color: Colors.blue,
                          child: Text('Item #$index'),
                        )),
              ),
            ),
            Container(height: 50, color: Colors.black),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return list[index];
                },
              ),
            ),
            Container(height: 50, color: Colors.black),
            Container(
              height: 400,
              child: ListView.separated(
                itemCount: list2.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return list2[index];
                },
              ),
            ),
            Container(height: 50, color: Colors.black),
            Container(
              height: 400,
              child: ListView.separated(
                itemCount: list3.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return list3[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:modulo9/app/pages/cidades_page.dart';
import 'package:modulo9/app/pages/layout_builder_page.dart';
import 'package:modulo9/app/pages/listas_page.dart';
import 'package:modulo9/app/pages/mediaquery_page.dart';
import 'package:modulo9/app/pages/navegacao_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modulo9/app/pages/scroll_list_page.dart';
import 'package:modulo9/app/pages/textos_botoes_page.dart';

class HomePage extends StatelessWidget {
  static String routerName = '/';

  @override
  Widget build(BuildContext context) {
    //default value : width : 1080px , height:1920px , allowFontScaling:false
    ScreenUtil.init(context, designSize: Size(1080, 2280));
    // ScreenUtil.init(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFF691A),
        elevation: 1,
        title: Text(
          'App Bar App 1',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Icon(Icons.ac_unit),
          Icon(Icons.camera),
          PopupMenuButton(
            //icon: Icon(Icons.camera_alt),
            //child: Text('Teste'),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Text('Media Query'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Navegação Page'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('Listas Page'),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Text('Layout Builder'),
                ),
                PopupMenuItem(
                  value: 5,
                  child: Text('Textos Botões'),
                ),
                PopupMenuItem(
                  value: 6,
                  child: Text('Scroll List'),
                ),
                PopupMenuItem(
                  value: 7,
                  child: Text('Cidades Arquivo'),
                ),
              ];
            },
            onSelected: (value) {
              switch (value) {
                case 1:
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => MediaqueryPage(),
                  // ));

                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //   builder: (context) => MediaqueryPage(),
                  // ));

                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (context) => MediaqueryPage()),
                  //     (router) => router.isFirst);

                  Navigator.of(context).pushNamed(MediaqueryPage.routerName);
                  // Navigator.of(context).pushReplacementNamed('/mediaQuery');
                  // Navigator.of(context).pushNamedAndRemoveUntil(
                  //   '/mediaQuery',
                  //   ModalRoute.withName('/'),
                  // );
                  break;
                case 2:
                  Navigator.of(context).pushNamed(NavegacaoPage.routerName);
                  break;
                case 3:
                  Navigator.of(context).pushNamed(ListasPage.routerName);
                  break;
                case 4:
                  Navigator.of(context).pushNamed(LayoutBuilderPage.routerName);
                  break;
                case 5:
                  Navigator.of(context).pushNamed(TextosBotoesPage.routerName);
                  break;
                case 6:
                  Navigator.of(context).pushNamed(ScrollListPage.routerName);
                  break;
                case 7:
                  Navigator.of(context).pushNamed(CidadesPage.routerName);
                  break;
                default:
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          // child: Image.asset(
          //   'assets/paisagem.jpg',
          //   fit: BoxFit.cover,
          //   alignment: Alignment.topLeft,
          // ),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/paisagem.jpg'),
                fit: BoxFit.cover,
              ),
              color:
                  Colors.amber, // precisa estar aqui caso exista o decoration
              // borderRadius: BorderRadius.circular(70),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(5, 5),
                ),
                BoxShadow(
                  color: Colors.deepOrange,
                  blurRadius: 10,
                  offset: Offset(-5, -5),
                ),
              ],
              border: Border.all(
                color: Colors.green,
                width: 1,
              )),
        ),
      ),
    );
  }
}

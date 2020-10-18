import 'package:flutter/material.dart';
import 'package:modulo9/app/pages/cidades_page.dart';
import 'package:modulo9/app/pages/home_page.dart';
import 'package:modulo9/app/pages/layout_builder_page.dart';
import 'package:modulo9/app/pages/listas_page.dart';
import 'package:modulo9/app/pages/mediaquery_page.dart';
import 'package:modulo9/app/pages/navegacao_page.dart';
import 'package:modulo9/app/pages/page1.dart';
import 'package:modulo9/app/pages/page2.dart';
import 'package:modulo9/app/pages/page3.dart';
import 'package:modulo9/app/pages/scroll_list_page.dart';
import 'package:modulo9/app/pages/textos_botoes_page.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academia Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      // routes: {
      //   MediaqueryPage.routerName: (_) => MediaqueryPage(),
      //   NavegacaoPage.routerName: (_) => NavegacaoPage(),
      //   Page1.routerName: (_) => Page1(),
      //   Page2.routerName: (_) {
      //     var nome = ModalRoute.of(_).settings.arguments;
      //     return Page2(
      //       nome: nome,
      //     );
      //   },
      // },
      onGenerateRoute: (settings) {
        final route = settings.name;
        Widget page;
        if (route == MediaqueryPage.routerName) {
          page = MediaqueryPage();
        } else if (route == NavegacaoPage.routerName) {
          page = NavegacaoPage();
        } else if (route == Page1.routerName) {
          page = Page1();
        } else if (route == Page2.routerName) {
          page = Page2(nome: settings.arguments);
        } else if (route == Page3.routerName) {
          page = Page3();
        } else if (route == ListasPage.routerName) {
          page = ListasPage();
        } else if (route == LayoutBuilderPage.routerName) {
          page = LayoutBuilderPage();
        } else if (route == TextosBotoesPage.routerName) {
          page = TextosBotoesPage();
        } else if (route == ScrollListPage.routerName) {
          page = ScrollListPage();
        } else if (route == CidadesPage.routerName) {
          page = CidadesPage();
        }

        return MaterialPageRoute(
            builder: (context) => page, settings: settings);
      },
    );
  }
}

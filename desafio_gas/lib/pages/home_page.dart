import 'dart:convert';

import 'package:desafio_gas/model/revenda_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';

  const HomePage({key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RevendaModel> revendas = [];

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/dados.json').then((jsonData) {
      setState(() {
        revendas = (json.decode(jsonData) as List)
            .map((e) => RevendaModel.fromMap(e))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Escolha uma revenda'),
        actions: [
          buildPopupOrdenacao(),
          buildPopupSuporte(),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            buildContainerTopo(),
            Expanded(
              child: buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<int> buildPopupOrdenacao() {
    return PopupMenuButton(
      icon: Icon(Icons.swap_vert),
      itemBuilder: (_) {
        return [
          PopupMenuItem(
            value: 1,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Melhor Avaliação',
                  style: TextStyle(color: Colors.blue),
                )),
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Mais Rápido',
                  style: TextStyle(color: Colors.blue),
                )),
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'Mais Barato',
                  style: TextStyle(color: Colors.blue),
                )),
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ];
      },
      onSelected: (value) {
        switch (value) {
          case 1:
            print('Ordenar por avaliação');
            break;
          case 2:
            print('Ordenar por rapidez');
            break;
          case 3:
            print('Ordenar por preço');
            break;
          default:
        }
      },
    );
  }

  PopupMenuButton<int> buildPopupSuporte() {
    return PopupMenuButton(
      icon: Text(
        '?',
        style: TextStyle(fontSize: 22),
      ),
      itemBuilder: (_) {
        return [
          PopupMenuItem(
            value: 1,
            child: Text(
              'Suporte',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              'Termos de serviço',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ];
      },
      onSelected: (value) {
        switch (value) {
          case 1:
            print('Abrir suporte');
            break;
          case 2:
            print('Abrir termos de serviço');
            break;
          default:
        }
      },
    );
  }

  Container buildContainerTopo() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Botijões de 13kg em:',
                style: TextStyle(color: Colors.grey, fontSize: 9),
              ),
              Text(
                'Av Paulista, 1001',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Paulista, São Paulo, SP',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
              Text('Mudar', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: revendas.length,
      itemBuilder: (context, index) {
        const altura = 110.0;

        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(12),
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: Container(
                  width: altura,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    revendas[index].tipo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    color: Color(revendas[index].corFormatada),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                ),
              ),
              //
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    bottom: 10,
                  ),
                  height: altura,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(revendas[index].nome)),
                          if (revendas[index].melhorPreco)
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.amber[700],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.label,
                                    color: Colors.white,
                                  ),
                                  Text('Melhor Preço',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      )),
                                ],
                              ),
                            ),
                        ],
                      ),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nota',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(children: [
                                Text(
                                  revendas[index].nota.toString(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 22,
                                ),
                              ]),
                            ],
                          ),
                          //
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tempo Médio',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    revendas[index].tempMedio,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'min',
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Preço',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  revendas[index].precoFormatado,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:desafio_gas/model/revenda_model.dart';
import 'package:flutter/material.dart';

class PedidoPage extends StatefulWidget {
  static String routeName = '/pedido_page';

  final RevendaModel revenda;

  const PedidoPage({Key key, this.revenda}) : super(key: key);

  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  double total = 0.0;
  int quantidade = 1;

  String totalFormatado() {
    return total.toStringAsFixed(2).replaceFirst('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    final RevendaModel revenda = widget.revenda;

    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Produtos'),
        actions: [
          PopupMenuButton(
              icon: Text(
                '?',
                style: TextStyle(fontSize: 22),
              ),
              itemBuilder: (_) {
                return [];
              })
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            // primeiro container: progressão da compra
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.only(bottom: 2),
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.grey[300],
                            size: 40,
                          ),
                          Icon(
                            Icons.circle,
                            color: Colors.blue,
                            size: 22,
                          ),
                        ],
                      ),
                      Text(
                        'Comprar',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: 60,
                    color: Colors.grey[400],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 40,
                          ),
                          Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.grey[400],
                            size: 22,
                          ),
                        ],
                      ),
                      Text(
                        'Pagamento',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    width: 60,
                    color: Colors.grey[400],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 40,
                          ),
                          Icon(
                            Icons.panorama_fish_eye,
                            color: Colors.grey[400],
                            size: 22,
                          ),
                        ],
                      ),
                      Text(
                        'Confirmação',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // segundo container: totalização
            Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Color(revenda.corFormatada),
                        size: 30,
                      ),
                      Text('1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          )),
                    ],
                  ),
                  Text(
                    ' ${revenda.nome} - Botijão de 13 kg',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[800],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text('R\$ ',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.grey[800],
                      )),
                  Text(totalFormatado(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            // terceiro container: detalhes do pedido
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.home,
                          size: 35,
                          color: Colors.grey,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                revenda.nome,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  revenda.nota.toString(),
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow[800],
                                  size: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text('', style: TextStyle(fontSize: 12)),
                            ),
                            Text(
                              '${revenda.tempMedio} min',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        // Expanded(child: SizedBox()),
                        Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.black,
                          alignment: Alignment.center,
                          child: Text(
                            revenda.tipo,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            children: [
                              Text(
                                'Botijão de 13kg',
                                style: TextStyle(fontSize: 12),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  revenda.nome,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                children: [
                                  Text(
                                    'R\$',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    revenda.precoFormatadoSemCifrao,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.grey,
                                size: 30,
                              ),
                              Icon(Icons.remove),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              quantidade > 0 ? quantidade-- : quantidade = 0;
                              total = quantidade * revenda.preco;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('images/botija.png'),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(2),
                                child: Text(
                                  '$quantidade',
                                  style: TextStyle(),
                                ),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 153, 0, 1),
                                    borderRadius: BorderRadius.circular(10)),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.grey,
                                size: 30,
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              quantidade++;
                              total = quantidade * revenda.preco;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                print('Ir para o pagamento!');
              },
              child: Container(
                width: 220,
                height: 75,
                margin: EdgeInsets.only(bottom: 45),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(95, 179, 247, 1),
                    Color.fromRGBO(26, 119, 210, 1),
                  ]),
                  borderRadius: BorderRadius.circular(60),
                ),
                alignment: Alignment.center,
                child: Text(
                  'IR PARA O PAGAMENTO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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

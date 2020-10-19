import 'package:flutter/material.dart';

class RevendaModel {
  final String tipo;
  final String nome;
  final String cor;
  final double nota;
  final String tempMedio;
  final bool melhorPreco;
  final double preco;

  RevendaModel({
    @required this.tipo,
    @required this.nome,
    @required this.cor,
    @required this.nota,
    @required this.tempMedio,
    @required this.melhorPreco,
    @required this.preco,
  });

  static RevendaModel fromMap(dynamic map) {
    return RevendaModel(
      tipo: map['tipo'],
      nome: map['nome'],
      cor: map['cor'],
      nota: map['nota'],
      tempMedio: map['tempoMedio'],
      melhorPreco: map['melhorPreco'],
      preco: map['preco'],
    );
  }

  String get precoFormatadoComCifrao =>
      'R\$ ' + preco.toStringAsFixed(2).replaceFirst('.', ',');

  String get precoFormatadoSemCifrao =>
      preco.toStringAsFixed(2).replaceFirst('.', ',');

  int get corFormatada => int.parse('0xFF' + cor);
}

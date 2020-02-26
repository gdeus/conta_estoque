import 'package:conta_estoque/models/Produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

class Pedido extends StatelessWidget {
  final List<Produto> produtos;
  String stringPedido;

  Pedido(this.produtos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela pedido " + produtos[0].fornecedor, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xfff89a3b)
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:
            ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return linhaPedido(produtos[index]);
                }),
          ),
          RaisedButton(child: Text("Enviar por WhatsApp!"),
            onPressed: () {
              criaStringPedido(produtos);
              print("cliquei");
              FlutterShareMe().shareToWhatsApp(msg: stringPedido);
            },)
        ],
      ),
    );
  }

  criaStringPedido(List<Produto> produtos) {
    stringPedido = 'Olá dessa semana da ' + produtos[0].fornecedor + ' vamos precisas de: \n';
    for (int i = 0; i < produtos.length; i++) {
      stringPedido = stringPedido + produtos[i].nome + ' ' +
          produtos[i].quantidadeNecessaria.toString() + '\n';
    }
    print(stringPedido);
    return stringPedido;
  }

  Widget linhaPedido(Produto produto) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(produto.nome + ': ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),
            ),
            Text(produto.quantidadeNecessaria.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
              ),),
          ],
        )
      ],
    );
  }
}

import 'package:conta_estoque/models/Produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

class Pedido extends StatelessWidget {
  final List<Produto> produtos;
  String stringPedido;
  List<Produto> produtosFiltrados = [];

  Pedido(this.produtos);

  @override
  Widget build(BuildContext context) {
    for(int i=0; i < produtos.length; i++){
      if(produtos[i].quantidadeNecessaria > 0){
        produtosFiltrados.add(produtos[i]);
      }
    }

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
                itemCount: produtosFiltrados.length,
                itemBuilder: (context, index) {
                  if(produtosFiltrados.length != 0){
                    return linhaPedido(produtosFiltrados[index]);
                  } else {
                    return Text("Não vamos precisar nada desse fornecedor essa semana, pode voltar a página :) ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold));
                  }
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
    stringPedido = 'Olá dessa semana da ' + produtosFiltrados[0].fornecedor + ' vamos precisar de: \n';
    for (int i = 0; i < produtosFiltrados.length; i++) {
      stringPedido = stringPedido + produtosFiltrados[i].quantidadeNecessaria.toString() + ' unidades de ' +
          produtosFiltrados[i].nome+ '\n';
    }
    stringPedido = stringPedido + '\n' + 'ATENÇÃO PEDIDO GERADO EM UNIDADES FAVOR READEQUAR ELE AO NÚMERO DE FARDOS OU CAIXAS NECESSÁRIOS. \n';
    stringPedido = stringPedido + 'Pedido gerado automaticamente pelo aplicativo Conta Estoque';
    print("----------------------------------------------------------------------------------------------");
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
                  fontSize: 24.0
              ),
            ),
            Text(produto.quantidadeNecessaria.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0
              ),),
          ],
        )
      ],
    );
  }
}

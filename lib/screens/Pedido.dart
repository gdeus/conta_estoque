import 'package:conta_estoque/models/Produto.dart';
import 'package:flutter/material.dart';

class Pedido extends StatelessWidget {
  final List<Produto> listProdutos;

  Pedido(this.listProdutos);

  @override
  Widget build(BuildContext context) {
    print(listProdutos[0].nome);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela pedido " + listProdutos[0].fornecedor),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:
            ListView.builder(
                itemCount: listProdutos.length,
                itemBuilder: (context, index){
                  return linhaPedido(listProdutos[index]);
                }),
          )
        ],
      ),
    );
  }

  Widget linhaPedido(Produto produto){
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

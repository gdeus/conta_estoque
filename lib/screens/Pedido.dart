import 'package:flutter/material.dart';

class Pedido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela pedido Ambev"),
      ),
      body: Column(
        children: <Widget>[
          SelectableText(
            'Guaraná Lata: 6 fardos'
          ),
          SelectableText(
              'Guaraná 2L: 2 fardos'
          ),
          SelectableText(
              'Corona: 1 fardos'
          ),
          SelectableText(
              'Bud: 9 fardos'
          ),
        ],
      ),
    );
  }
}

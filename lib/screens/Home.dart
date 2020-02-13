import 'package:conta_estoque/Service/Service.dart';
import 'package:conta_estoque/models/Produto.dart';
import 'package:conta_estoque/screens/Pedido.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int quantidadeProdutos;
  List<Produto> listProdutosFiltrados = [];
  Service service = new Service();
  List<Produto> listProdutos = [];
  List<TextEditingController> controladores = [];

  String dropdownValue = 'Ambev';
  @override
  Widget build(BuildContext context) {
    listProdutos = service.criaProdutos();
    listProdutosFiltrados = listProdutos.where((produtos) => produtos.fornecedor == dropdownValue).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Conta estoque"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.99,
              child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 60,
                  elevation: 14,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  ),
                  underline: Container(
                      height: 2,
                      color: Colors.black
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownValue = newValue;
                      print(newValue);
                      listProdutosFiltrados = listProdutos.where((produtos) => produtos.fornecedor == dropdownValue).toList();
                    });
                  },
                  items: <String>['Ambev', 'Eisenbah', 'Coca', 'Polina', 'Prats', 'Diversos', 'Sodas', 'Ingredientes', 'Carnes', 'Embalagens']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
            ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: listProdutosFiltrados.length,
                  itemBuilder: (context, index){
                    controladores.add(TextEditingController());
                    return produtoRow(listProdutosFiltrados[index], controladores[index]);
                  })
            ),
          ),
          RaisedButton(
            onPressed: () {
              for(int i = 0; i < listProdutosFiltrados.length; i++){
                listProdutosFiltrados[i].quantidadeTotal = int.parse(controladores[i].text);
                listProdutosFiltrados[i].quantidadeNecessaria = listProdutosFiltrados[i].calculaQuantidade(listProdutosFiltrados[i]);
              }

              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Pedido(listProdutosFiltrados)
              ));
            },
            child: const Text(
                'Fazer pedido',
                style: TextStyle(fontSize: 20)
            ),
          ),
        ],
      ),
    );
  }

  Widget produtoRow(Produto produto, TextEditingController controlador){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Text(produto.nome,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: controlador,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius:  BorderRadius.only()),
            ),

          ),
        )

      ],
    );
  }
}
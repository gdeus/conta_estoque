import 'package:conta_estoque/Service/Service.dart';
import 'package:conta_estoque/models/Produto.dart';
import 'package:conta_estoque/screens/Pedido.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final int tipoLogin;

  HomeScreen({@required this.tipoLogin});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int quantidadeProdutos;
  List<Produto> listProdutosFiltrados = [];
  Service service = new Service();
  List<Produto> listProdutos = [];
  String dropdownValue;
  List<TextEditingController> controladores = [];
  List<String> _garcons = ['Ambev', 'Eisenbah', 'Coca', 'Prats', 'Sodas', 'Diversos'];
  List<String> _cozinha = ['Polina',  'Ingredientes', 'Carnes'];

  List<String> preencheDropDown(){
    if(widget.tipoLogin == 0){
      return _garcons;
    } else {
      return _cozinha;
    }
  }

  String valorInicialDropDown(){
    if(widget.tipoLogin == 0){
      return 'Ambev';
    } else {
      return 'Polina';
    }
  }

  @override
  void initState() {
    super.initState();
    dropdownValue = valorInicialDropDown();
  }

  @override
  Widget build(BuildContext context) {
    valorInicialDropDown();
    listProdutos = service.criaProdutos(widget.tipoLogin);
    listProdutosFiltrados = listProdutos.where((produtos) => produtos.fornecedor == dropdownValue).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Conta estoque - Burger House",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xfff89a3b),
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
                  items: preencheDropDown().map((cozinha) {
                    return DropdownMenuItem(
                      child: Text(cozinha),
                      value: cozinha
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
                if(controladores[i].text.isEmpty){
                  listProdutosFiltrados[i].quantidadeTotal = 0;
                } else {
                  listProdutosFiltrados[i].quantidadeTotal =
                      int.parse(controladores[i].text);
                }
                listProdutosFiltrados[i].quantidadeNecessaria = listProdutosFiltrados[i].calculaQuantidade(listProdutosFiltrados[i]);
                controladores[i].text = '';
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
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
  List<Produto> listProdutos;
  Service service = new Service();

  String dropdownValue = 'Ambev';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conta estoque"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
              child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 30,
                  elevation: 14,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold
                  ),
                  underline: Container(
                      height: 2,
                      color: Colors.deepOrangeAccent
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownValue = newValue;
                      print(newValue);
                      criaProdutos();
                    });
                  },
                  items: <String>['Ambev', 'Eisenbah', 'Coca', 'Polina']
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
              child: FutureBuilder(
                future: criaProdutos(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    default:
                      return Column(
                        children: <Widget>[
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 10.0),
                              itemCount: listProdutos.length,
                              itemBuilder: (context, index){
                                return ProdutoRow(listProdutos[index]);
                              },
                            ),
                          )
                        ],
                     );
                   }
                },
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Pedido()
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

  criaProdutos() async{
    listProdutos = await service.CriaProdutos(dropdownValue);
    quantidadeProdutos = await listProdutos.length;

    print(listProdutos.length);
    print(listProdutos[0].nome);
    print(listProdutos[1].nome);
  }

  Widget ProdutoRow(Produto produto){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(produto.nome,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius:  BorderRadius.only())
            ),

          ),
        )

      ],
    );
  }
}

import 'package:conta_estoque/screens/Pedido.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
                  itemHeight: 40.0,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 30,
                  elevation: 14,
                  isExpanded: true,
                  style: TextStyle(
                      color: Colors.deepOrange,
                  ),
                  underline: Container(
                      height: 2,
                      color: Colors.deepOrangeAccent
                  ),
                  onChanged: (String newValue){
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Ambev', 'Eisenbah', 'Coca', 'Polina']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text("Corona",
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
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text("Budwaiser",
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              Expanded(
                flex: 1,
                child: TextField(

                ),
              )

            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text("Guaraná 2L",
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              Expanded(
                flex: 1,
                child: TextField(

                ),
              )

            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text("Guaraná Lata",
                  style: TextStyle(
                      fontSize: 20
                  ),),
              ),
              Expanded(
                flex: 1,
                child: TextField(

                ),
              )

            ],
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

  void criaProdutos(){

  }
}
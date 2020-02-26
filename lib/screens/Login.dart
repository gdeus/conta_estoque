import 'package:conta_estoque/screens/Home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int tipoLogin;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('images/logoburger.jpg'),
            width: MediaQuery.of(context).size.width * 0.75,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.width * 0.15,
            child: RaisedButton(
              child: Text("Trabalho como garçom"),
              color: Color(0xfff89a3b),
              onPressed: (){
                tipoLogin = 0; // 0 = logado como garçom
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeScreen(tipoLogin: tipoLogin,)
                ));//
              },
            ),

          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            height: MediaQuery.of(context).size.width * 0.15,
            child: RaisedButton(
              color: Color(0xfff89a3b),
              child: Text("Trabalho na cozinha"),
              onPressed: (){
                tipoLogin = 1; // 1 = logado como cozinha
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeScreen(tipoLogin: tipoLogin,)
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

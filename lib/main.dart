import 'package:conta_estoque/screens/Login.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sistema Cobrança',
        debugShowCheckedModeBanner: false,
        home: Login()
    );
  }
}

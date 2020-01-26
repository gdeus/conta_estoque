import 'package:conta_estoque/models/Produto.dart';

class Service {

  Future<List<Produto>> CriaProdutos(String fornecedor) async{
    List<Produto> listProdutos = [
      new Produto('Skol', 85, 0, 'Ambev'),
      new Produto('Budwaiser', 45, 0, 'Ambev'),
      new Produto('Batata Frisé', 30, 0, 'Polina'),
      new Produto('Batata Rústica', 42, 0, 'Ambev')
    ];
    List<Produto> listProdutosFltrados = [];

    for(var i = 0; i <= listProdutos.length; i++){
      print(listProdutos[i].nome);
      if(listProdutos[i].fornecedor == fornecedor){
        listProdutosFltrados.add(listProdutos[i]);
        print("entrei no for " + i.toString());
      }
    }

    print(listProdutosFltrados.length);

    return listProdutosFltrados;
  }


}
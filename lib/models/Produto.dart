class Produto{
  String nome;
  int quantidadeIdeal;
  int quantidadeTotal;
  String fornecedor;
  int quantidadeNecessaria;

  Produto(nome, quantidadeIdeal, quantidadeTotal, fornecedor){
    this.nome = nome;
    this.quantidadeIdeal = quantidadeIdeal;
    this.quantidadeTotal = quantidadeTotal;
    this.fornecedor = fornecedor;
  }

  calculaQuantidade(Produto produto){
    return produto.quantidadeIdeal - produto.quantidadeTotal;
  }
}
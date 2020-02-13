import 'package:conta_estoque/models/Produto.dart';

class Service {

  List<Produto> criaProdutos(){
    List<Produto> listProdutos = [
      // EISENBAH

      new Produto('Long Eisenbahn Pilsen', 120, 0, 'Eisenbah'),
      new Produto('Pale Ale', 24, 0, 'Eisenbah'),
      new Produto('Ipa', 24, 0, 'Eisenbah'),
      new Produto('Weizen', 24, 0, 'Eisenbah'),
      new Produto('Strong Gold Ale', 24, 0, 'Eisenbah'),
      new Produto('Sol Long', 72, 0, 'Eisenbah'),

      // COCA

      new Produto('Heineken', 72, 0, 'Coca'),
      new Produto('Coca Lata', 144, 0, 'Coca'),
      new Produto('Coca 0', 24, 0, 'Coca'),
      new Produto('Coca 2L', 48, 0, 'Coca'),
      new Produto('Coca 600ML', 300, 0, 'Coca'),//2cx
      new Produto('Fanta Laranja', 24, 0, 'Coca'),
      new Produto('Fanta Uva', 24, 0, 'Coca'),
      new Produto('Sprite', 24, 0, 'Coca'),
      new Produto('Citrus', 24, 0, 'Coca'),
      new Produto('Tônica', 24, 0, 'Coca'),
      new Produto('Agua Com Gas', 48, 0, 'Coca'),
      new Produto('Agua Sem Gás', 48, 0, 'Coca'),
      new Produto('Del Valle Uva', 12, 0, 'Coca'),
      new Produto('Del Valle Goiaba', 12, 0, 'Coca'),
      new Produto('Del Valle Pêssego', 12, 0, 'Coca'),
      new Produto('Del Valle Maracujá', 12, 0, 'Coca'),

      // AMBEV

      new Produto('Corona', 36, 0, 'Ambev'),
      new Produto('BudWeiser', 72, 0, 'Ambev'),
      new Produto('Guaraná Lata', 72, 0, 'Ambev'),
      new Produto('Guaraná 2 L', 18, 0, 'Ambev'),

      // PRATS

      new Produto('Prats Uva', 2, 0, 'Prats'),
      new Produto('Prats Laranja', 3, 0, 'Prats'),

      // DIVERSOS

      new Produto('Limão', 3, 0, 'Diversos'),//KG
      new Produto('Açucar', 4, 0, 'Diversos'),//KG
      new Produto('Pinga', 2, 0, 'Diversos'),//LITRO
      new Produto('Vodka', 2, 0, 'Diversos'),//LITRO
      new Produto('GIN', 2, 0, 'Diversos'),//VAZIO
      new Produto('Guardanapo Mesas', 24, 0, 'Diversos'),
      new Produto('Toalhas Banheiro', 2, 0, 'Diversos'),
      new Produto('Papel Higiênico', 12, 0, 'Diversos'),
      new Produto('Alcool', 3, 0, 'Diversos'),
      new Produto('Palitos', 0, 0, 'Diversos'),//NO CAMPO HAVIA UM X
      new Produto('Sabonete Liquido', 5, 0, 'Diversos'),//LITRO
      new Produto('Canudinho', 2, 0, 'Diversos'),//2cx
      new Produto('Sacola P', 0, 0, 'Diversos'),//CAMPO VAZIO
      new Produto('Sacola M', 0, 0, 'Diversos'),//CAMPO VAZIO
      new Produto('Sacola G', 0, 0, 'Diversos'),//CAMPO VAZIO
      new Produto('Sachê Ketchup', 6, 0, 'Diversos'), //6cx
      new Produto('Sache Maionese', 6, 0, 'Diversos'),//6cx
      new Produto('Sache Mostarda', 2, 0, 'Diversos'),//2cx

      // SODAS

      new Produto('Maça Verde', 0, 0, 'Sodas'),
      new Produto('Maracuja', 0, 0, 'Sodas'),
      new Produto('Cranberry', 0, 0, 'Sodas'),
      new Produto('Limao Siciliano', 0, 0, 'Sodas'),
      new Produto('Mojito', 0, 0, 'Sodas'),
      new Produto('Blueberry', 0, 0, 'Sodas'),

      // INGREDIENTES

      new Produto('Tomate', 36, 0, 'Ingredientes'),
      new Produto('Alface', 3, 0, 'Ingredientes'),
      new Produto('Cebola Roxa', 12, 0, 'Ingredientes'),
      new Produto('Doritos', 4, 0, 'Ingredientes'),
      new Produto('Leite', 8, 0, 'Ingredientes'),
      new Produto('Oleo de Soja', 8, 0, 'Ingredientes'),
      new Produto('Mostarda Hemmer', 1, 0, 'Ingredientes'),
      new Produto('Cruotons p Salada', 6, 0, 'Ingredientes'),
      new Produto('Queijo Ralado Grosso', 1, 0, 'Ingredientes'),
      new Produto('Sal Refinado', 6, 0, 'Ingredientes'),
      new Produto('Sal Grosso', 6, 0, 'Ingredientes'),
      new Produto('Pimenta', 0, 0, 'Ingredientes'),
      new Produto('Frango', 0, 0, 'Ingredientes'),
      new Produto('Caldo de CArne', 0, 0, 'Ingredientes'),
      new Produto('Cebola Branca', 0, 0, 'Ingredientes'),
      new Produto('Ketchup Galao', 0, 0, 'Ingredientes'),
      new Produto('Chumi Churry', 0, 0, 'Ingredientes'),
      new Produto('Azeite de Oliva', 0, 0, 'Ingredientes'),

      // POLINA

      new Produto('Batata Frise', 25, 0, 'Polina'),
      new Produto('Batata Rustica', 10, 0, 'Polina'),
      new Produto('Batata Canoa', 5, 0, 'Polina'),
      new Produto('Batata Delivery', 10, 0, 'Polina'),
      new Produto('Batata Doce', 3, 0, 'Polina'),// 2-3
      new Produto('Travesseiro de Mandioca', 5, 0, 'Polina'),
      new Produto('Aneis de Cebola', 5, 0, 'Polina'),
      new Produto('Bacon', 25, 0, 'Polina'),
      new Produto('Pettit Gatteu', 24, 0, 'Polina'),
      new Produto('Molho Vermelho', 2, 0, 'Polina'),
      new Produto('Brownie', 0, 0, 'Polina'),
      new Produto('Burger do Futuro', 0, 0, 'Polina'),
      new Produto('Churros', 0, 0, 'Polina'),
      new Produto('Nutella', 0, 0, 'Polina'),

      // Molhos

      new Produto('Manteiga', 6, 0, 'Molhos'),
      new Produto('Queijo Cheddar', 12, 0, 'Molhos'),
      new Produto('Queijo Mussarela', 12, 0, 'Molhos'),
      new Produto('Queijo Coalho', 6, 0, 'Molhos'),
      new Produto('Molho Chipotle', 10, 0, 'Molhos'),
      new Produto('Cheddar Cremoso', 2, 0, 'Molhos'),

      // CARNES

      new Produto('Costelinhas BBQ(CRUA)', 0, 0, 'Carnes'),
      new Produto('Costelinhas BBQ(sem assar)', 0, 0, 'Carnes'),
      new Produto('Ancho', 0, 0, 'Carnes'),

      // EMBALAGENS

      new Produto('Saco Delivery', 2, 0, 'Embalagens'),//2 FARD
      new Produto('Papel Embrulho', 2, 0, 'Embalagens'),//2 FARD
      new Produto('Embalagens de Plastico Salada Delivery', 40, 0, 'Embalagens'),
      new Produto('Papel Batatas', 200, 0, 'Embalagens'),//un
      new Produto('Isopor para frango', 100, 0, 'Embalagens'),
      new Produto('Separador de Hamburguer', 1, 0, 'Embalagens'),//FARDO
      new Produto('Papel Pequeno Hamburguer mesas', 0, 0, 'Embalagens')


    ];

    return listProdutos;
  }


}
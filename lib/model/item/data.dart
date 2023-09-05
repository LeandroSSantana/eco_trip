class Item {
  final String imageUrl;
  final String title;
  final String description;

  Item({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

List<Item> items = [
  Item(
    imageUrl: 'http://tinyurl.com/2zfjy2a7',
    title: 'Miami',
    description: 'Miami é uma cidade internacional no extremo sudeste da Flórida. Sua influência cubana se reflete nos cafés e lojas de charutos que ocupam a Calle Ocho, em Little Havana. Nas águas de cor azul-turquesa da Biscayne Bay ficam Miami Beach e South Beach, um bairro glamouroso conhecido por suas construções coloridas em art déco, areia branca, hotéis para surfistas e casas noturnas famosas',
  ),
  Item(
    imageUrl: 'url_da_imagem_2',
    title: 'Título 2',
    description: 'Descrição longa do item 2...',
  ),
  // Adicione mais itens conforme necessário
];

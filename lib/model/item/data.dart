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
    imageUrl: 'http://tinyurl.com/map6f9xz',
    title: 'Havana',
    description: 'La Habana (Havana), a capital de Cuba, é uma cidade cheia de paradoxos e contradições, cujas principais atrações são a beleza de seu centro histórico, sua arquitetura excepcional, a iconografia revolucionária e cubana (de El Malecón à Plaza de la Revolución, passando por La Giraldilla) e sua ampla oferta cultural fazem da cidade de Havana um dos melhores destinos para se visitar na América Latina',
  ),
  Item(
    imageUrl: 'url_da_imagem_2',
    title: 'Título 2',
    description: 'Descrição longa do item 2...',
  ),
  // Adicione mais itens conforme necessário
];

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
    imageUrl: 'https://tinyurl.com/3cvazxff',
    title: 'Miami',
    description: '',
  ),
];

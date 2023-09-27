class Places {
  final String placeImage;
  final String name;
  final String description;
  final double rating;

  Places({
    required this.placeImage,
    required this.name,
    required this.description,
    required this.rating,
  });
}

final List<Places> fPlaces = [
  Places(
    placeImage: 'images/bg_01.png',
    name: 'Lugar 1',
    description: 'Este é o Lugar 1, uma ótima opção para turismo.',
    rating: 4.7,
  ),
  Places(
    placeImage: 'images/bg_02.png',
    name: 'Lugar 2',
    description: 'O Lugar 2 oferece uma vista deslumbrante da natureza.',
    rating: 4.9,
  ),
  Places(
    placeImage: 'images/bg_01.png',
    name: 'Lugar 3',
    description: 'Visite o Lugar 3 para uma experiência cultural única.',
    rating: 4.5,
  ),
  Places(
    placeImage: 'images/bg_02.png',
    name: 'Lugar 4',
    description: 'Lugar 4 é conhecido por sua gastronomia excepcional.',
    rating: 4.8,
  ),
  Places(
    placeImage: 'images/bg_01.png',
    name: 'Lugar 5',
    description: 'Explore o Lugar 5 e descubra segredos escondidos.',
    rating: 4.6,
  ),
];

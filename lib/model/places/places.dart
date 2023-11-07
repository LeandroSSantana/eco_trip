import 'package:cloud_firestore/cloud_firestore.dart';

class Places {
  final String placeImage;
  final String name;
  final int days;
  final double budget;
  final String description;
  final double rating;

  Places({
    required this.placeImage,
    required this.name,
    required this.days,
    required this.budget,
    required this.description,
    required this.rating,
  });
}

List<Places> fPlaces = [
  Places(
    placeImage: 'images/bg_01.png',
    name: 'Lugar 1',
    days: 10,
    budget: 1000.00,
    description: 'Este é o Lugar 1, uma ótima opção para turismo.',
    rating: 4.7,
  ),
  Places(
    placeImage: 'images/bg_01.png',
    name: 'Lugar 1',
    days: 10,
    budget: 1000.00,
    description: 'Este é o Lugar 1, uma ótima opção para turismo.',
    rating: 4.7,
  ),
  Places(
    placeImage: 'images/bg_01.png',
    name: 'Lugar 1',
    days: 10,
    budget: 1000.00,
    description: 'Este é o Lugar 1, uma ótima opção para turismo.',
    rating: 4.7,
  ),
  Places(
    placeImage: 'images/bg_01.png',
    name: 'Lugar 1',
    days: 10,
    budget: 1000.00,
    description: 'Este é o Lugar 1, uma ótima opção para turismo.',
    rating: 4.7,
  ),
];

// Função para buscar dados do Firebase
Future<void> fetchDataFromFirebase(List<Places> placesList) async {
  final firestore = FirebaseFirestore.instance;
  final querySnapshot = await firestore.collection('viagens').get();

  final documents = querySnapshot.docs;

  for (final document in documents) {
    final data = document.data();
    final place = Places(
      placeImage: data['placeImage'] ?? '',
      name: data['name'] ?? '',
      days: data['days'] ?? 0,
      budget: data['budget'] != null ? data['budget'].toDouble() : 0.0,
      description: data['description'] ?? '',
      rating: data['rating'] != null ? data['rating'].toDouble() : 0.0,
    );

    placesList.add(place);
  }
}

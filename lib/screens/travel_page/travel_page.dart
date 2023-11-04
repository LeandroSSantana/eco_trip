import 'package:flutter/material.dart';
import 'package:teste_telas/model/item/data.dart';
import 'package:teste_telas/screens/category/category_page.dart';
import 'package:teste_telas/screens/typesTrip/alimentationPage.dart';
import 'package:teste_telas/screens/typesTrip/barPage.dart';
import 'package:teste_telas/screens/typesTrip/culturePage.dart';
import 'package:teste_telas/screens/typesTrip/esportPage.dart';
import 'package:teste_telas/screens/typesTrip/eventsPage.dart';
import 'package:teste_telas/screens/typesTrip/hotelPage.dart';
import 'package:teste_telas/screens/typesTrip/outingPage.dart';

class TravelPage extends StatefulWidget {
  final String localValue;

  TravelPage({String? localValue, Key? key})
      : localValue = localValue ?? '',
        super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List<String> categories = [
    'Alimentação',
    'Passeios',
    'Cultura',
    'Bares',
    'Esportes',
    'Hotel',
    'Eventos'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                child: Image.network(
                  items[0].imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return buildCategoryListTile(
                  context,
                  categories[index]

                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Função para criar um item clicável da lista
Widget buildCategoryListTile(BuildContext context, String label) {
  return ListTile(
    title: Text(label),
    onTap: () {
      if (label == 'Alimentação') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AlimentationPage(),
          ),
        );
      } else if (label == 'Passeios') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OutingPage(),
          ),
        );
      } else if (label == 'Cultura') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CulturePage(),
          ),
        );
      } else if (label == 'Bares') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BarPage(),
          ),
        );
      }else if (label == 'Esportes') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EsportPage(),
          ),
        );
      }else if (label == 'Hotel') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HotelPage(),
          ),
        );
      } else if (label == 'Eventos') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventsPage(),
          ),
        );
      }
    },
  );
}

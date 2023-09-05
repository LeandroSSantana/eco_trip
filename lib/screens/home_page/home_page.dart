// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/screens/category/alimentacao_page.dart';
import 'package:teste_telas/screens/category/dicas_page.dart';
import 'package:teste_telas/screens/category/passeios_page.dart';
import 'package:teste_telas/screens/category/vida_noturna_page.dart';

import '../../model/item/data.dart';
import '../../widgets/category/category_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final item = items[0];
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 35, 10, 10),
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        showFullDescription
                            ? item.description
                            : (item.description.length > 50
                                ? item.description.substring(0, 50) + '...'
                                : item.description),
                      ),
                      if (item.description.length > 50) SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showFullDescription = !showFullDescription;
                          });
                        },
                        child: Text(
                          showFullDescription ? 'Leia menos' : 'Leia mais',
                          style: TextStyle(color: Color(0xFFFF8C00)),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navegue para a tela de Dicas
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DicasPage(),
                          ));
                        },
                        child: CategoryItemWidget(
                          label: 'Dicas',
                          icon: Icons.attach_money,
                          iconColor: Colors.blue,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // Navegue para a tela de Dicas
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PasseiosPage(),
                          ));
                        },
                        child: CategoryItemWidget(
                          label: 'Passeios',
                          icon: Icons.map_rounded,
                          iconColor: Colors.deepOrangeAccent,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // Navegue para a tela de alimentação
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AlimentacaoPage(),
                          ));
                        },
                        child: CategoryItemWidget(
                          label: 'Alimetação',
                          icon: Icons.food_bank_rounded,
                          iconColor: Colors.lightGreen,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          // Navegue para a tela de Vida Noturna
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VidaNoturnaPage(),
                          ));
                        },
                        child: CategoryItemWidget(
                          label: 'Vida Noturna',
                          icon: Icons.wine_bar,
                          iconColor: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 45.0,
            left: 20.0,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: CupertinoNavigationBarBackButton(
                  onPressed: () {
                    // TODO Implementar ação de voltar aqui
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

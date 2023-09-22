import 'package:flutter/material.dart';
import 'package:teste_telas/model/item/data.dart';
import 'package:teste_telas/screens/category/alimentacao_page.dart';
import 'package:teste_telas/screens/category/compras_page.dart';
import 'package:teste_telas/screens/category/dicas_page.dart';
import 'package:teste_telas/screens/category/passeios_page.dart';
import 'package:teste_telas/screens/category/vida_noturna_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final imageUrl = items[0].imageUrl;

    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCustomContainer(
                      icon: Icons.food_bank_outlined,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return AlimentacaoPage();
                            }));
                      },
                    ),
                    _buildCustomContainer(
                      icon: Icons.favorite,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return DicasPage();
                            }));
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCustomContainer(
                      icon: Icons.beach_access,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return PasseiosPage();
                            }));
                      },
                    ),
                    _buildCustomContainer(
                      icon: Icons.wine_bar_outlined,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return VidaNoturnaPage();
                            }));
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCustomContainer(
                      icon: Icons.shopping_cart,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return ComprasPage();
                            }));
                      },
                    ),
                    _buildCustomContainer(
                      icon: Icons.event,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return DicasPage();
                            }));
                      },
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 30,
              left: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para criar o Container personalizado com ícone e destino
  Widget _buildCustomContainer(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 140,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 60, // Tamanho do ícone ajustável
            color: Color(0xFF0047AB),
          ),
        ),
      ),
    );
  }
}

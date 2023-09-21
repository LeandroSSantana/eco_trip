import 'package:flutter/material.dart';
import 'package:teste_telas/model/item/data.dart';
import 'package:teste_telas/screens/category/alimentacao_page.dart';
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                      icon: Icons.star,
                      onTap: () {
                        // Navegue para a tela desejada quando o quadrado for clicado.
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AlimentacaoPage();
                        }));
                      },
                    ),
                    _buildCustomContainer(
                      icon: Icons.favorite,
                      onTap: () {
                        // Navegue para outra tela quando o quadrado for clicado.
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
                      icon: Icons.star,
                      onTap: () {
                        // Navegue para a tela desejada quando o quadrado for clicado.
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PasseiosPage();
                        }));
                      },
                    ),
                    _buildCustomContainer(
                      icon: Icons.favorite,
                      onTap: () {
                        // Navegue para outra tela quando o quadrado for clicado.
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return VidaNoturnaPage();
                        }));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Função para criar o Container personalizado com ícone e destino
  Widget _buildCustomContainer(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      // Chama a função de navegação quando o container for clicado
      child: Container(
        width: 140,
        height: 140,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 50, // Tamanho do ícone ajustável
            color: Colors.white, // Cor do ícone ajustável
          ),
        ),
      ),
    );
  }
}

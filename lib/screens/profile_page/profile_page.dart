import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  Widget customButton(BuildContext context, String text, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF0047AB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Adicione aqui o código para o header
                Container(
                  // Exemplo de estilo para o header, ajuste conforme necessário
                  height: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 270, 0, 10),
                      child: Text(
                        'Minhas Viagens',
                        style: TextStyle(
                          color: Color(0xFF0047AB),
                          fontFamily: 'Roboto-light',
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/featured_places_page');
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Color(0xFF0047AB)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Adicione aqui a lógica para o clique no segundo quadrado
                            print('Segundo quadrado clicado!');
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Color(0xFF0047AB)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Botões de Salvar e Calcular
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: customButton(context, 'Salvar', '/save_travel_page'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: customButton(context, 'Calcular', '/travel_filter_page'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

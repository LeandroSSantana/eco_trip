// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:teste_telas/data/perfil_data.dart';
import 'package:teste_telas/model/places/places.dart';
import 'package:teste_telas/widgets/featured_places.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            headerPageProfile(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 260, 0, 5),
                  child: Text(
                    'Categorias',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Light',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconWidget(Icons.face),
                      IconWidget(Icons.face),
                      IconWidget(Icons.face),
                      IconWidget(Icons.face),
                      IconWidget(Icons.face),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 10),
                  child: Text(
                    'Lugaresm em Destaque',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato_light',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: fPlaces.map((place) {
                      return FeaturedPlaces(places: place);
                    }).toList(),
                  ),
                ),



                Padding(
                  padding: EdgeInsets.fromLTRB(30, 15, 0, 10),
                  child: Text(
                    'Treinadores em Destaque',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Light',
                      fontSize: 25,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                // FeaturedTrainers(trainers: trainers),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;

  IconWidget(this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            // Adicione a ação que deseja realizar quando um ícone for pressionado.
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue, // Cor de fundo
              shape: BoxShape.circle, // Formato circular
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white, // Cor do ícone
                size: 30, // Tamanho do ícone
              ),
            ),
          ),
        ));
  }
}

Widget buildFeaturePlaces(BuildContext context, String label, IconData icon) {
  return InkWell(
    onTap: () {
      // Adicione a ação que deseja realizar quando um lugar em destaque for pressionado.
    },
    child: Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xFFD0FC04),
            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Lato_light',
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}

Stack headerPageProfile(BuildContext context) {
  return Stack(
    children: [
      Container(
        color: Color(0xFF0047AB,).withOpacity(0.8),
        width: double.infinity,
        height: 250,
        margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  //contorno imagem
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(
                    perfilUsuario.fotoPerfil,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                perfilUsuario.nomeUsuario,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFDFD),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        // icone voltar
        top: 35,
        left: 12.5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Adicione a lógica para voltar à tela anterior aqui
            Navigator.pop(context);
          },
        ),
      ),
    ],
  );
}

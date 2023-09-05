// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/model/profile/perfil_usuario_model.dart';

class PerfilPage extends StatelessWidget {
  final PerfilUsuario perfil;

  PerfilPage({required this.perfil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFf9f40),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 100, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFFF8c00),
                    width: 1.5,
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(perfil.fotoPerfil),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Text(
                  perfil.nomeUsuario,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFF8c00),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 40, 10),
                child: CupertinoFormRow(
                  prefix: Icon(
                    Icons.place_outlined,
                    color: Color(0xFFFF8c00),
                  ),
                  child: CupertinoTextField(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all(
                        color: Color(0xFFFF8c00),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    placeholder: 'Qual Seu Destino?',
                    onChanged: (value) {
                      // Lógica para atualizar o orçamento
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 40, 10),
                child: CupertinoFormRow(
                  prefix: Icon(
                    Icons.attach_money,
                    color: Color(0xFFFF8c00),
                  ),
                  child: CupertinoTextField(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      border: Border.all(
                        color: Color(0xFFFF8c00),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    placeholder: 'Digite o orçamento da viagem',
                    onChanged: (value) {
                      // Lógica para atualizar o orçamento
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 40, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Text(
                        'Qual Seu Tipo de Viagem?',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFFF8c00),
                        ),
                      ),
                    ),
                    CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          pickerTextStyle: TextStyle(
                            fontSize: 18.0, // Ajuste o tamanho do texto
                            color: Color(0xFFFF8c00), // Altere a cor do texto
                          ),
                        ),
                      ),
                      child: CupertinoPicker(
                        itemExtent: 32,
                        backgroundColor: Colors.white38,
                        onSelectedItemChanged: (int index) {},
                        children: <Widget>[
                          Text('Econômica'),
                          Text('Moderada'),
                          Text('Luxuosa'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CupertinoButton(
          onPressed: () {
            // Lógica para iniciar a viagem
          },
          color: Colors.orange,
          child: Text(
            'Viajar',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

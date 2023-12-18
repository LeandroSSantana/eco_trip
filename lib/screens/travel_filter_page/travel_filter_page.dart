// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/screens/travel_page/travel_page.dart';

class TravelFilterPage extends StatefulWidget {
  @override
  _TravelFilterPageState createState() => _TravelFilterPageState();
}

class _TravelFilterPageState extends State<TravelFilterPage> {
  TextEditingController cidadeController = TextEditingController();
  TextEditingController orcamentoController = TextEditingController();
  String estiloDeViagem = 'Economico'; // Adicione essa propriedade

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      appBar: AppBar(
        title: Text('Calculadora de Viagem'),
        backgroundColor: Color(0xFF0047AB),
      ),
      body: GestureDetector(
        onTap: () {
          // Fecha o teclado ao tocar fora do campo de texto
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: CupertinoTextField(
                      controller: cidadeController,
                      placeholder: 'Local de Destino',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: CupertinoTextField(
                      controller: orcamentoController,
                      placeholder: 'Orçamento',
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDFD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Qual seu estilo de Viagem?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF0047AB),
                    ),
                  ),
                  DropdownButton<String>(
                    value: estiloDeViagem,
                    onChanged: (value) {
                      setState(() {
                        estiloDeViagem = value!;
                      });
                    },
                    items: <String>['Economico', 'Moderado', 'Luxuoso']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text('Estilo de Viagem'),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0047AB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Obtém os valores inseridos nos campos de texto
                      String cidade = cidadeController.text;
                      String orcamento = orcamentoController.text;

                      // Navega para a página de viagem com os parâmetros de filtro
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TravelPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: Text('Filtrar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

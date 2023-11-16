import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_telas/screens/travel_page/travel_page.dart';

class TravelFilterPage extends StatefulWidget {
  TravelFilterPage({Key? key}) : super(key: key);

  @override
  _TravelFilterPageState createState() => _TravelFilterPageState();
}

class _TravelFilterPageState extends State<TravelFilterPage> {
  final TextEditingController localDeDestinoController =
  TextEditingController();
  final TextEditingController orcamentoController = TextEditingController();
  String estiloDeViagem = "Economico";
  int percentualPasseios = 0;
  int percentualCultura = 0;
  int percentualEsportes = 0;
  int percentualEventos = 0;
  int percentualAlimentacao = 0;
  int percentualHoteis = 0;

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
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: CupertinoTextField(
                    controller: localDeDestinoController,
                    placeholder: 'Local de Destino',
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFDFD),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                Text('Qual seu estilo de Viagem?',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xFF0047AB))),
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
                Text('Quanto deseja dispor de seu orçamento em:',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color(0xFF0047AB))),
                SizedBox(height: 15),
                _buildSlider('Passeios', percentualPasseios),
                _buildSlider('Cultura', percentualCultura),
                _buildSlider('Esportes', percentualEsportes),
                _buildSlider('Eventos', percentualEventos),
                _buildSlider('Alimentacao', percentualAlimentacao),
                _buildSlider('Hoteis', percentualHoteis),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TravelPage(),
                    ));
                  },
                  color: Color(0xFF0047AB),
                  borderRadius: BorderRadius.circular(50),
                  minSize: 50,
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Calcular Viagem',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(String label, int value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $value%'),
        GestureDetector(
          onTap: () {
            // Impede que o teclado apareça
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Slider(
            value: value.toDouble(),
            onChanged: (newValue) {
              setState(() {
                switch (label) {
                  case 'Passeios':
                    percentualPasseios = newValue.toInt();
                    break;
                  case 'Cultura':
                    percentualCultura = newValue.toInt();
                    break;
                  case 'Esportes':
                    percentualEsportes = newValue.toInt();
                    break;
                  case 'Eventos':
                    percentualEventos = newValue.toInt();
                    break;
                  case 'Alimentacao':
                    percentualAlimentacao = newValue.toInt();
                    break;
                  case 'Hoteis':
                    percentualHoteis = newValue.toInt();
                    break;
                }
              });
            },
            min: 0,
            max: 100,
            divisions: 20,
            // De 5 em 5
            label: '$value%',
            activeColor: Color(0xFF0047AB), // Definindo a cor do Slider
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TravellingDataPage extends StatefulWidget {
  const TravellingDataPage({Key? key}) : super(key: key);

  @override
  _TravellingDataPageState createState() => _TravellingDataPageState();
}

class _TravellingDataPageState extends State<TravellingDataPage> {
  TextEditingController localController = TextEditingController();
  TextEditingController diasController = TextEditingController();
  TextEditingController orcamentoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  String tipoViagem = 'Simples';
  Uint8List? selectedImageBytes;
  double nota = 1.0; // Valor inicial da nota

  void SendToFirestore() {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String local = localController.text;
    int dias = int.tryParse(diasController.text) ?? 0;
    double orcamento =
        double.tryParse(orcamentoController.text.replaceAll(',', '.')) ?? 0.0;
    String descricao = descricaoController.text;

    firestore.collection('viagens').add({
      'local': local,
      'dias': dias,
      'orcamento': orcamento,
      'tipo_viagem': tipoViagem,
      'descricao': descricao,
      'nota': nota,
    }).then((value) {
      print('Dados salvos com sucesso no Firestore!');
    }).catchError((error) {
      print('Erro ao salvar os dados no Firestore: $error');
    });
  }

  void _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        selectedImageBytes = Uint8List.fromList(imageBytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Fecha o teclado ao tocar fora dos campos de texto
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  // icone voltar
                  top: 40,
                  left: 12.5,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFF0047AB),
                    ),
                    onPressed: () {
                      // Adicione a lógica para voltar à tela anterior aqui
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  // Margens laterais
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          _pickImage();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          color: Colors.grey[300],
                          child: selectedImageBytes != null
                              ? Image.memory(selectedImageBytes!,
                                  fit: BoxFit.cover)
                              : Icon(Icons.add_a_photo,
                                  size: 60, color: Color(0xFF0047AB)),
                        ),
                      ),
                      SizedBox(height: 30),
                      CupertinoTextField(
                        controller: localController,
                        placeholder: 'Local',
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFDFD),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              controller: diasController,
                              placeholder: 'Dias',
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFDFD),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              keyboardType:
                                  TextInputType.number, // Teclado numérico
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CupertinoTextField(
                              controller: orcamentoController,
                              placeholder: 'Orçamento',
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFDFD),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              keyboardType:
                                  TextInputType.number, // Teclado numérico
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CupertinoTextField(
                        controller: descricaoController,
                        placeholder: 'Descrição',
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFDFD),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        maxLines: 5, // Aumenta a altura do campo de descrição
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<double>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(
                              color: Color(0xFF0047AB),
                            ),
                          ),
                          labelText: 'Nota',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        value: nota,
                        onChanged: (double? value) {
                          setState(() {
                            nota = value ?? 1.0;
                          });
                        },
                        items: [1.0, 2.0, 3.0, 4.0, 5.0].map((double value) {
                          return DropdownMenuItem<double>(
                            value: value,
                            child: Text(value.toStringAsFixed(1)),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      CupertinoButton(
                        onPressed: () {
                          SendToFirestore();
                        },
                        color: Color(0xFF0047AB),
                        borderRadius: BorderRadius.circular(40),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Text(
                            'Salve sua Viagem',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

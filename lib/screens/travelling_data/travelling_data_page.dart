// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase/supabase.dart';

final supabase = SupabaseClient(
  'sua_url_do_supabase',
  'sua_api_key',
);

class TravellingDataPage extends StatefulWidget {
  const TravellingDataPage({Key? key}) : super(key: key);

  @override
  _TravellingDataPageState createState() => _TravellingDataPageState();
}

class _TravellingDataPageState extends State<TravellingDataPage> {
  TextEditingController localController = TextEditingController();
  TextEditingController diasController = TextEditingController();
  TextEditingController orcamentoController = TextEditingController();
  String tipoViagem = 'Simples';
  Uint8List? selectedImageBytes;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        selectedImageBytes = bytes;
      });
    }
  }

  Future<void> uploadImage() async {
    if (selectedImageBytes != null) {
      final base64Image = base64Encode(selectedImageBytes!);

      await supabase
          .from('imagens')
          .upsert([{'imagem': base64Image}])
          .execute();

      print('Imagem enviada com sucesso!');
    }
  }

  Future<void> enviarDadosParaSupabase() async {
    String local = localController.text;
    int dias = int.tryParse(diasController.text) ?? 0;
    double orcamento = double.tryParse(orcamentoController.text.replaceAll(',', '.')) ?? 0.0;

    await supabase.from('viagens').insert([
      {
        'local': local,
        'dias': dias,
        'orcamento': orcamento,
        'foto': 'URL_da_imagem', // Substitua pela URL da imagem enviada
        'tipo_viagem': tipoViagem,
      }
    ]).execute();

    print('Dados salvos com sucesso!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              buildCupertinoTextField('Local', localController),
              SizedBox(height: 10),
              buildCupertinoTextField('Dias', diasController),
              SizedBox(height: 10),
              buildCupertinoTextField('Orçamento', orcamentoController),
              SizedBox(height: 10),
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 150,
                  color: Colors.grey[300],
                  child: selectedImageBytes != null
                      ? Image.memory(selectedImageBytes!, fit: BoxFit.cover)
                      : Icon(Icons.add_a_photo, size: 60, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(
                      color: Color(0xFF0047AB),
                    ),
                  ),
                  labelText: 'Tipo de viagem',
                  filled: true,
                  fillColor: Colors.white,
                ),
                value: tipoViagem,
                onChanged: (String? value) {
                  setState(() {
                    tipoViagem = value ?? 'Simples';
                  });
                },
                items: ['Simples', 'Moderada', 'Luxuosa'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 50),
              CupertinoButton(
                onPressed: () {
                  // Realizar o upload da imagem aqui
                  uploadImage();

                  // Enviar dados para o Supabase
                  enviarDadosParaSupabase();
                },
                color: Color(0xFF0047AB),
                borderRadius: BorderRadius.circular(40),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    'Salve sua Viagem',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CupertinoTextField buildCupertinoTextField(String placeholder, TextEditingController controller) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFFFFDFD),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}

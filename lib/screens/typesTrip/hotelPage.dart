// ignore: file_names
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HotelPage(),
    );
  }
}

class HotelPage extends StatefulWidget {
  @override
  HotelPageState createState() => HotelPageState();
}

// Função para carregar o arquivo JSON
Future<String> loadJsonData() async {
  try {
    final String data = await rootBundle.loadString('assets/dados.json');
    return data;
  } catch (e) {
    throw Exception('Falha ao carregar o arquivo JSON: $e');
  }
}


class HotelPageState extends State<HotelPage> {
  List<dynamic> jsonData = [];

  @override
  void initState() {
    super.initState();
    loadJsonData().then((data) {
      setState(() {
        jsonData = json.decode(data);
        jsonData = jsonData.where((item) => item['Categoria'] ==  'Hotel').toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotéis'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: jsonData.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: jsonData.map((e) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${e['AtracaoNome']}', style: const TextStyle(color: Color(0xFF1F4AC2), fontFamily: 'Roboto-Regular'),),
                          const SizedBox(height: 5),
                          Text('Descricao: ${e['Descricao']}'),
                          const SizedBox(height: 5),
                          Text('Categoria: ${e['Categoria']}'),
                          const SizedBox(height: 5),
                          Text('Localizacao: ${e['Localizacao']}'),
                          const SizedBox(height: 5),
                          Text('Custo: ${e['Custo']}'),
                          const SizedBox(height: 5),
                          Text('Avaliacao: ${e['Avaliacao']}'),
                          Divider(), // Add a divider between each data set
                        ],
                      );
                    }).toList(),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}



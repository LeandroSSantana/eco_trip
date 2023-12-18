// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FeaturedTravelsPage extends StatelessWidget {
  FeaturedTravelsPage({Key? key});

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final _stream = supabase
        .from('viagens')
        .stream(primaryKey: ['id'])
        .order('destino', ascending: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("Viagens Destacadas"),
        backgroundColor: Color(0xFF0047AB),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: CircularProgressIndicator());
          }

          final viagens = snapshot.data!;

          return ListView.builder(
            itemCount: viagens.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    'Destino: ${viagens[index]['destino']}',
                    style: TextStyle(
                      color: Color(0xFF0047AB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText('País', viagens[index]['pais']),
                      _buildText('Duração (dias)', viagens[index]['qtddias']),
                      _buildText('Tipo de Viagem', viagens[index]['tipoviagem']),
                      _buildText('Descrição', viagens[index]['descricao']),
                      _buildText('Gasto Alimentação', viagens[index]['gastoalimentacao']),
                      _buildText('Gasto Passeios', viagens[index]['gastopasseios']),
                      _buildText('Gasto Cultura', viagens[index]['gastocultura']),
                      _buildText('Gasto Esporte', viagens[index]['gatoesporte']),
                      _buildText('Gasto Eventos', viagens[index]['gastoeventos']),
                      _buildText('Gasto Hotel', viagens[index]['gastohotel']),
                      _buildText('Gasto Total', calculateTotalExpense(viagens[index])),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          _buildText('Nota', viagens[index]['nota']),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildText(String label, dynamic content) {
    return Text(
      '$label: $content',
      style: TextStyle(
        color: Color(0xFF0047AB),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  double calculateTotalExpense(Map<String, dynamic> viagem) {
    double total = 0.0;

    // Adicione as chaves dos gastos que deseja incluir no total
    List<String> keys = [
      'gastoalimentacao',
      'gastopasseios',
      'gastocultura',
      'gatoesporte',
      'gastoeventos',
      'gastohotel',
    ];

    // Somar os gastos associados à viagem
    for (String key in keys) {
      total += (viagem[key] ?? 0.0) as double;
    }

    return total;
  }
}

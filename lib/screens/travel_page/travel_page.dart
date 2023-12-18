// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  late final SupabaseClient supabase;
  List<Map<String, dynamic>> locais = [];
  String filtroCidade = ''; // Adicione essa propriedade

  @override
  void initState() {
    super.initState();
    // Inicialize o SupabaseClient no initState
    supabase = SupabaseClient(
      'https://stwidkgzdzfsqtswlwhd.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN0d2lka2d6ZHpmc3F0c3dsd2hkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk5NjYzMDgsImV4cCI6MjAxNTU0MjMwOH0.8jcwVzCLnaNikRNjzgPTwrAAfQcKPzeTKkiYeL5_6iQ',
    );
    _filtrarPorCidade(); // Chame o método de filtro no initState
  }

  Future<void> _filtrarPorCidade() async {
    try {
      final response = await supabase
          .from('locais')
          .select()
          .eq('cidade', filtroCidade) // Adicione a condição de filtro
          .execute();

      if (response.data != null) {
        print('Erro ao consultar o Supabase: ${response.data}');
        // Tratar o erro conforme necessário
        return;
      }

      List<Map<String, dynamic>> data = [];

      if (response.data is List<dynamic>) {
        data = List<Map<String, dynamic>>.from(response.data as List<dynamic>);
      } else if (response.data is Map<String, dynamic>) {
        data.add(response.data as Map<String, dynamic>);
      }

      setState(() {
        locais = data;
      });
    } catch (error) {
      print('Erro inesperado ao consultar o Supabase: $error');
      // Tratar o erro conforme necessário
    }
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

  @override
  Widget build(BuildContext context) {
    final _stream = supabase
        .from('locais')
        .stream(primaryKey: ['id']).order('atracaonome', ascending: true);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF0047AB),
          title: Text("Locais em Destaque")),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return const Center(child: CircularProgressIndicator());
          }
          final todos = snapshot.data!;

          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final local = todos[index];

              return Card(
                child: ListTile(
                  title: Text(
                    local['atracaonome'],
                    style: TextStyle(
                      color: Color(0xFF0047AB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText('Cidade', local['cidade']),
                      _buildText('Local', local['atracaonome']),
                      _buildText('Descrição', local['descricao']),
                      _buildText('Categoria', local['categoria']),
                      _buildText('Endereço', local['localizacao']),
                      _buildText('Estilo', local['estilodeviagem']),
                      _buildText('Preço', '${local['valor']}'),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          _buildText('Avaliação', '${local['avaliacao']}'),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF0047AB),
        child: Icon(Icons.add),
        onPressed: () {
          // Substitua '/create' pelo nome da rota para criar um novo local
          Navigator.of(context).pushNamed('/save_local_page');
        },
      ),
    );
  }
}

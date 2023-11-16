import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TravelPage extends StatelessWidget {
  TravelPage({Key? key});
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final _stream = supabase
        .from('locais')
        .stream(primaryKey: ['id'])
        .order('cidade', ascending: true);

    return Scaffold(
      appBar: AppBar(
          title: Text("Locais"),
        backgroundColor: Color(0xFF0047AB),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return const Center(child: CircularProgressIndicator());
          }
          final locais = snapshot.data!;

          return ListView(
            children: locais
                .map(
                  (local) => Card(
                child: ListTile(
                  title: Text(
                    'Destino: ${local['atracaonome']}',
                    style: TextStyle(
                      color: Color(0xFF0047AB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText('Cidade', local['cidade']),
                      _buildText('Localização', local['localizacao']),
                      _buildText('Categoria', local['categoria']),
                      _buildText('Valores', local['valor']),
                      _buildText('Estilo', local['estilodeviagem']),
                      _buildText('Descrição', local['descricao']),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          _buildText('Avaliação', local['avaliacao']),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/save_local_page'),
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
}

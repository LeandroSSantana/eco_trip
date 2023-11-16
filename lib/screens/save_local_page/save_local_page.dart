// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SaveLocalPage extends StatefulWidget {
  const SaveLocalPage({Key? key}) : super(key: key);

  @override
  _SaveLocalPageState createState() => _SaveLocalPageState();
}

class _SaveLocalPageState extends State<SaveLocalPage> {
  TextEditingController cidadeController = TextEditingController();
  TextEditingController atracaoNomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  final List<String> categorias = [
    'Alimentação',
    'Passeios',
    'Eventos',
    'Hotel',
    'Esportes',
    'Bares',
    'Cultura',
  ];

  final List<String> estilosDeViagem = ['Econômico', 'Moderado', 'Luxuoso'];

  final List<String> avaliacoes = ['1', '2', '3', '4', '5'];

  String selectedCategoria = 'Alimentação';
  String selectedEstiloDeViagem = 'Econômico';
  String selectedAvaliacao = '1';

  late SupabaseClient supabase;

  @override
  void initState() {
    super.initState();
    supabase = Supabase.instance.client;
  }

  Future<void> SendToSupabase() async {
    final String cidade = cidadeController.text.trim();
    final String atracaoNome = atracaoNomeController.text.trim();
    final String descricao = descricaoController.text.trim();
    final String localizacao = localizacaoController.text.trim();
    final String valorText = valorController.text.trim();

    if (cidade.isEmpty ||
        atracaoNome.isEmpty ||
        descricao.isEmpty ||
        localizacao.isEmpty ||
        valorText.isEmpty) {
      // Exiba uma mensagem ao usuário indicando que todos os campos são obrigatórios
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Todos os campos são obrigatórios'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final double valor = double.tryParse(valorText.replaceAll(',', '.')) ?? 0.0;

    final response = await supabase.from('locais').insert([
      {
        'cidade': cidade,
        'atracaonome': atracaoNome,
        'descricao': descricao,
        'categoria': selectedCategoria,
        'localizacao': localizacao,
        'estilodeviagem': selectedEstiloDeViagem,
        'valor': valor,
        'avaliacao': int.parse(selectedAvaliacao),
      }
    ]).execute();

    if (response.data != null) {
      print('Erro ao enviar dados para o Supabase: ${response.data!.message}');
    } else {
      // SnackBar indicando que os dados foram salvos
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Local Salvo com Sucesso'),
          duration: Duration(seconds: 2),
        ),
      );
      // Limpar os campos do formulário
      cidadeController.clear();
      atracaoNomeController.clear();
      descricaoController.clear();
      localizacaoController.clear();
      valorController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        appBar: AppBar(
          title: Text('Salvar Local'),
          backgroundColor: Color(0xFF0047AB),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cidade'),
                                SizedBox(height: 5),
                                CupertinoTextField(
                                  controller: cidadeController,
                                  placeholder: 'Cidade',
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFDFD),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Local'),
                                SizedBox(height: 5),
                                CupertinoTextField(
                                  controller: atracaoNomeController,
                                  placeholder: 'Local',
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFDFD),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Descrição'),
                          SizedBox(height: 10),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: descricaoController,
                            placeholder: 'Descrição',
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFDFD),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            maxLines: 5,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Endereço'),
                                SizedBox(height: 5),
                                CupertinoTextField(
                                  controller: localizacaoController,
                                  placeholder: 'Endereço',
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFDFD),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Valor'),
                                SizedBox(height: 5),
                                CupertinoTextField(
                                  controller: valorController,
                                  placeholder: 'Valor',
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFDFD),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Categoria'),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFDFD),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Color(0xFF0047AB),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: selectedCategoria,
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCategoria = newValue!;
                                    });
                                  },
                                  items: categorias
                                      .map<DropdownMenuItem<String>>(
                                        (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Estilo'),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFDFD),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Color(0xFF0047AB),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: selectedEstiloDeViagem,
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedEstiloDeViagem = newValue!;
                                    });
                                  },
                                  items: estilosDeViagem
                                      .map<DropdownMenuItem<String>>(
                                        (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Avaliação'),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFFDFD),
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Color(0xFF0047AB),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: selectedAvaliacao,
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedAvaliacao = newValue!;
                                    });
                                  },
                                  items: avaliacoes
                                      .map<DropdownMenuItem<String>>(
                                        (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  )
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CupertinoButton(
                        onPressed: () {
                          SendToSupabase();
                        },
                        color: Color(0xFF0047AB),
                        borderRadius: BorderRadius.circular(40),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Text(
                            'Salvar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Espaço abaixo do botão
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

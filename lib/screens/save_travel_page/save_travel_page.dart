// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SaveTravelPage extends StatefulWidget {
  const SaveTravelPage({Key? key}) : super(key: key);

  @override
  _SaveTravelPageState createState() => _SaveTravelPageState();
}

class _SaveTravelPageState extends State<SaveTravelPage> {
  TextEditingController destinoController = TextEditingController();
  TextEditingController paisController = TextEditingController();
  TextEditingController qtddiasController = TextEditingController();
  TextEditingController gastoAlimentacaoController = TextEditingController();
  TextEditingController gastoPasseiosController = TextEditingController();
  TextEditingController gastoCulturaController = TextEditingController();
  TextEditingController gastoEsporteController = TextEditingController();
  TextEditingController gastoEventosController = TextEditingController();
  TextEditingController gastoHotelController = TextEditingController();
  TextEditingController tipoViagemController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController notaController = TextEditingController();
  TextEditingController imagemUrlController = TextEditingController();

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

  Future<void> sendToSupabase() async {
    final String destino = destinoController.text.trim();
    final String pais = paisController.text.trim();
    final int qtddias = int.tryParse(qtddiasController.text.trim()) ?? 0;
    final double gastoAlimentacao =
        double.tryParse(gastoAlimentacaoController.text.trim()) ?? 0.0;
    final double gastoPasseios =
        double.tryParse(gastoPasseiosController.text.trim()) ?? 0.0;
    final double gastoCultura =
        double.tryParse(gastoCulturaController.text.trim()) ?? 0.0;
    final double gastoEsporte =
        double.tryParse(gastoEsporteController.text.trim()) ?? 0.0;
    final double gastoEventos =
        double.tryParse(gastoEventosController.text.trim()) ?? 0.0;
    final double gastoHotel =
        double.tryParse(gastoHotelController.text.trim()) ?? 0.0;
    final String tipoViagem = tipoViagemController.text.trim();
    final String descricao = descricaoController.text.trim();
    final int nota = int.tryParse(notaController.text.trim()) ?? 0;
    final String imagemUrl = imagemUrlController.text.trim();

    final response = await supabase.from('viagens').insert([
      {
        'destino': destino,
        'pais': pais,
        'qtddias': qtddias,
        'gastoalimentacao': gastoAlimentacao,
        'gastopasseios': gastoPasseios,
        'gastocultura': gastoCultura,
        'gatoesporte': gastoEsporte,
        'gastoeventos': gastoEventos,
        'gastohotel': gastoHotel,
        'tipoviagem': tipoViagem,
        'descricao': descricao,
        'nota': nota,
        'imagem_url': imagemUrl,
      }
    ]).execute();

    if (response.data != null) {
      print('Erro ao enviar dados para o Supabase: ${response.data!.message}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Viagem Salva com Sucesso'),
          duration: Duration(seconds: 2),
        ),
      );
      // Limpar os controladores após salvar
      destinoController.clear();
      paisController.clear();
      qtddiasController.clear();
      gastoAlimentacaoController.clear();
      gastoPasseiosController.clear();
      gastoCulturaController.clear();
      gastoEsporteController.clear();
      gastoEventosController.clear();
      gastoHotelController.clear();
      tipoViagemController.clear();
      descricaoController.clear();
      notaController.clear();
      imagemUrlController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      appBar: AppBar(
        title: Text('Salvar Viagem'),
        backgroundColor: Color(0xFF0047AB),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
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
                          Text('Destino'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: destinoController,
                            placeholder: 'Destino',
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
                          Text('País'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: paisController,
                            placeholder: 'País',
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
                Text(
                  'Gastos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Alimentação'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: gastoAlimentacaoController,
                            placeholder: 'Gasto em Alimentação',
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
                          Text('Passeios'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: gastoPasseiosController,
                            placeholder: 'Gasto em Passeios',
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cultura'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: gastoCulturaController,
                            placeholder: 'Gasto em Cultura',
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
                          Text('Esporte'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: gastoEsporteController,
                            placeholder: 'Gasto em Esporte',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Eventos'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: gastoEventosController,
                            placeholder: 'Gasto em Eventos',
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
                          Text('Hotel'),
                          SizedBox(height: 5),
                          CupertinoTextField(
                            controller: gastoHotelController,
                            placeholder: 'Gasto em Hotel',
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
                SizedBox(height: 20),
                Text(
                  'Detalhes da Viagem',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Dias'),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFDFD),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Color(0xFF0047AB),
                              ),
                            ),
                            child: CupertinoTextField(
                              controller: qtddiasController,
                              placeholder: 'Dias',
                              padding: EdgeInsets.all(12),
                              keyboardType: TextInputType.number,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFDFD),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Estilo'),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
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
                    ),
                  ],
                ),

                SizedBox(height: 10),
                // Row para a propriedade de enviar foto
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Nota'),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
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
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Enviar Foto'),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () async {
                              // ImagePicker para selecionar uma imagem da galeria
                              final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                              if (pickedFile != null) {
                                // Atualize o controller com o caminho da imagem selecionada
                                imagemUrlController.text = pickedFile.path;
                              }
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFDFD),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Color(0xFF0047AB),
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Color(0xFF0047AB),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CupertinoButton(
                  onPressed: () {
                    sendToSupabase();
                  },
                  color: Color(0xFF0047AB),
                  borderRadius: BorderRadius.circular(40),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 00,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

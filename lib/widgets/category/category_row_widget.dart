import 'package:flutter/material.dart';
import 'package:teste_telas/screens/category/alimentacao_page.dart';
import 'package:teste_telas/screens/category/dicas_page.dart';
import 'package:teste_telas/screens/category/passeios_page.dart';
import 'package:teste_telas/screens/category/vida_noturna_page.dart';
import 'package:teste_telas/widgets/category/category_item_widget.dart';

SingleChildScrollView categoryRowWidget(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            // Navegue para a tela de Dicas
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DicasPage(),
            ));
          },
          child: CategoryItemWidget(
            label: 'Dicas',
            icon: Icons.attach_money,
            iconColor: Colors.blue,
          ),
        ),

        GestureDetector(
          onTap: () {
            // Navegue para a tela de Dicas
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PasseiosPage(),
            ));
          },
          child: CategoryItemWidget(
            label: 'Passeios',
            icon: Icons.map_rounded,
            iconColor: Colors.deepOrangeAccent,
          ),
        ),

        GestureDetector(
          onTap: () {
            // Navegue para a tela de alimentação
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AlimentacaoPage(),
            ));
          },
          child: CategoryItemWidget(
            label: 'Alimetação',
            icon: Icons.food_bank_rounded,
            iconColor: Colors.lightGreen,
          ),
        ),

        GestureDetector(
          onTap: () {
            // Navegue para a tela de Vida Noturna
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VidaNoturnaPage(),
            ));
          },
          child: CategoryItemWidget(
            label: 'Vida Noturna',
            icon: Icons.wine_bar,
            iconColor: Colors.redAccent,
          ),
        ),
      ],
    ),
  );
}

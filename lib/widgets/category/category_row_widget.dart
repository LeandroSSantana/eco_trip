import 'package:flutter/material.dart';
import 'package:teste_telas/screens/category/alimentacao_page.dart';
import 'package:teste_telas/screens/category/dicas_page.dart';
import 'package:teste_telas/screens/category/passeios_page.dart';
import 'package:teste_telas/screens/category/vida_noturna_page.dart';
import 'package:teste_telas/widgets/category/category_item_widget.dart';

Widget buildCategoryItem(BuildContext context, String label, IconData icon, Color iconColor, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => page,
      ));
    },
    child: CategoryItemWidget(
      label: label,
      icon: icon,
      iconColor: iconColor,
    ),
  );
}

Widget buildCategoryRow(BuildContext context) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: buildCategoryItem(
              context,
              'Dicas',
              Icons.attach_money,
              Colors.blue,
              DicasPage(),
            ),
          ),
          Expanded(
            child: buildCategoryItem(
              context,
              'Passeios',
              Icons.map_rounded,
              Colors.deepOrangeAccent,
              PasseiosPage(),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: buildCategoryItem(
              context,
              'Alimentação',
              Icons.food_bank_rounded,
              Colors.lightGreen,
              AlimentacaoPage(),
            ),
          ),
          Expanded(
            child: buildCategoryItem(
              context,
              'Vida Noturna',
              Icons.wine_bar,
              Colors.redAccent,
              VidaNoturnaPage(),
            ),
          ),
        ],
      ),
    ],
  );
}

SingleChildScrollView categoryRowWidget(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: buildCategoryRow(context),
  );
}

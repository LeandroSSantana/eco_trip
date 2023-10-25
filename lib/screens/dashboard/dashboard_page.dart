import 'package:flutter/material.dart';
import 'package:teste_telas/widgets/elements/dashboard_form.dart';
import 'package:teste_telas/widgets/elements/top_left_circles.dart';
import 'package:teste_telas/widgets/header/header_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFdcdcdc),
      body: Stack(
        children: [
          buildTopLeftCircles(),
          headerPage(context),
          Positioned(
            top: 270,
            left: 0,
            right: 0,
            child: DashboardForm(),
          ),
        ],
      ),
    );
  }
}

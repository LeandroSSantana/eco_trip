import 'package:flutter/material.dart';
import 'package:teste_telas/widgets/elements/dashboard_form.dart';
import 'package:teste_telas/widgets/header/header_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFdcdcdc),
        body: Column(
          children: [
            headerPage(context),
            Expanded(
              child: SingleChildScrollView(
                child: DashboardForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

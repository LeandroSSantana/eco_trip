// // ignore_for_file: prefer_const_constructors
//
// import 'package:flutter/material.dart';
// import 'package:teste_telas/screens/travel_page/travel_page.dart';
//
// class DashboardForm extends StatefulWidget {
//   @override
//   _DashboardFormState createState() => _DashboardFormState();
// }
//
// class _DashboardFormState extends State<DashboardForm> {
//   TextEditingController localController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 10),
//           Container(
//             margin: EdgeInsets.only(bottom: 20.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide: BorderSide(
//                     color: Color(0xFF0047AB),
//                   ),
//                 ),
//                 labelText: 'Local',
//               ),
//               onChanged: (value) {},
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 16.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide: BorderSide(
//                     color: Color(0xFF0047AB),
//                   ),
//                 ),
//                 labelText: 'Dias',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 16.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide: BorderSide(
//                     color: Color(0xFF0047AB),
//                   ),
//                 ),
//                 labelText: 'Orçamento',
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 16.0),
//             child: DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(50.0),
//                   borderSide: BorderSide(
//                     color: Color(0xFF0047AB),
//                   ),
//                 ),
//                 labelText: 'Tipo de viagem',
//               ),
//               items: ['Economica', 'Moderada', 'Luxuosa'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? value) {},
//             ),
//           ),
//           Center(
//             child: SizedBox(
//               width: 210.0,
//               height: 50.0,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           TravelPage(localValue: localController.text),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xFF0047AB),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50.0),
//                   ),
//                 ),
//                 child: Text(
//                   'Calcule sua Viagem',
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class SearchWidget extends StatefulWidget {
//
//   final String name;
//   final String capital;
// final  fn;
//
//   SearchWidget({this.name, this.capital, this.fn});
//
//   @override
//   _SearchWidgetState createState() => _SearchWidgetState();
// }
//
// class _SearchWidgetState extends State<SearchWidget> {
//   final controller =TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 42,
//       margin: EdgeInsets.all(16),
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.white,
//         border: Border.all(color: Colors.black)
//       ),
//       child: TextField(
//
//         controller:  controller,
//         decoration: InputDecoration(
//           icon: Icon(Icons.search),
//           suffixIcon:
//               GestureDetector(
//                 onTap: (){
//                   widget.fn(controller.text);
//                   controller.clear();
//
//                   print('1');
//                   // FocusScope.of(context).requestFocus(Foc)
//                 },
//                 child: Icon(Icons.close),
//
//               )
//         ),
//       ),
//     ) ;
//   }
// }

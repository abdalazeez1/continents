// import 'package:delete/helper/provider.dart';
// import 'package:delete/helper/repo.dart';
// import 'package:delete/widgets/search_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   ProviderData prov;
//   List<Repo> city = [];
//   String query = '';
//   List<Repo> searchList = [];
//
//   @override
//   Widget build(BuildContext context) {
//     city = Provider.of<ProviderData>(context).prefer;
//
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           buildSearch(),
//           Expanded(
//               child: ListView.builder(
//             itemBuilder: (ctx, i) {
//               return Text(query);
//             },
//             itemCount: 2,
//           ))
//         ],
//       ),
//     );
//   }
//
//   Widget buildSearch() => SearchWidget(name: query, capital: '', fn: search);
//
//   void search(String query) {
//     city = prov.prefer;
//     print(city);
//     print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//     final search = prov.getSearch().where((element) {
//       final name = element.name.toLowerCase();
//       final searchName = query.toLowerCase();
//       return name.contains(searchName);
//     }).toList();
//     setState(() {
//       searchList = search;
//       this.query = query;
//     });
//   }
// }

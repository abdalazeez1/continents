import 'dart:ui';
import 'package:delete/widgets/detail_widget.dart';
import 'package:provider/provider.dart';
import 'package:delete/helper/provider.dart';
import 'package:delete/helper/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Repo data;
  final allData;
  var prov=ProviderData();
DetailScreen({Key key, this.data, this.allData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
prov=Provider.of<ProviderData>(context);
    var size = MediaQuery.of(context).size;
    int len = data.languages.length;
    String lan = '';

    allData['languages'].forEach((key, value) {
      for (int i = 0; i < len; i++) {
        if (data.languages[i] == key) {
          lan = ' $lan.  ${(value['name'])} .';

        }
      }
    });

    return Scaffold(

      backgroundColor: prov.isDark?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,

      appBar: AppBar(

        backgroundColor:prov.isDark?Theme.of(context).primaryColor: Theme.of(context).accentColor,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: data.phone,
            child: Center(
              child: Text(
                data.emoji,
                style: TextStyle(fontSize: 100),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.black,
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: DetailWidget(
                    size: size,
                    data: data,
                    title: data.name,
                    subT: 'Name',
                    icon: Icon(Icons.drive_file_rename_outline),
                  )),
                  Expanded(
                      child: DetailWidget(
                    size: size,
                    data: data,
                    title: data.phone,
                    subT: 'Phone',
                    icon: Icon(Icons.phone),
                  )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: DetailWidget(
                    size: size,
                    data: data,
                    title: data.native,
                    subT: 'Native',
                    icon: Icon(Icons.accessibility),
                  )),
                  Expanded(
                      child: DetailWidget(
                    size: size,
                    data: data,
                    title: data.currency,
                    subT: 'Currency',
                    icon: Icon(Icons.code),
                  )),
                ],
              ),
              DetailWidget(
                isCenter: true,
                size: size,
                data: data,
                title: lan,
                subT: 'Language',
                icon: Icon(Icons.language),
              )
            ],
          )
        ],
      ),
    );
  }
}

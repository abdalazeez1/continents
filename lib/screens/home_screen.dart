import 'package:delete/helper/provider.dart';
import 'package:delete/screens/favorite_screen.dart';
import 'package:delete/screens/search.dart';
import 'package:delete/widgets/card_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChose = false;
  var prov=ProviderData();

  List extract=[];
int index=0;

  @override
  Widget build(BuildContext context) {
    prov=Provider.of<ProviderData>(context);
    var size = MediaQuery.of(context).size;
    extract=Provider.of<ProviderData>(context).extract;
    return Scaffold(
      backgroundColor: prov.isDark?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
        drawer:  DrawerWidget(),
        appBar: AppBar(
backgroundColor:prov.isDark?Theme.of(context).primaryColor: Theme.of(context).accentColor,
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchScreen()));
          }),
            IconButton(icon: Icon(Icons.favorite_border), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>FavoriteScreen()));
          }),
          ],
        ),
        body:

        ListView(
          children: [
            Row(
              children: [
                CardHome(size: size,text:  extract[0],push: 'AF',),
                CardHome(size: size,text: extract[1],push: 'NA',),

              ],
            ),
            Row(
              children: [
                CardHome(size: size,text:  extract[2],push: 'AS',),
                CardHome(size: size,text: extract[3],push: 'EU',),

              ],
            ),
            Row(
              children: [
                CardHome(size: size,text:  extract[4],push: 'NA',),
                CardHome(size: size,text:  extract[5],push: 'OC',),


              ],
            ),
            Center(child:  CardHome(size: size,text: extract[6],push: 'SA',),)
          ],
        ), );
  }
}

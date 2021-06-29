import 'package:delete/screens/search.dart';
import 'package:delete/widgets/card_city.dart';
import 'package:delete/helper/provider.dart';
import 'package:delete/helper/repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorite_screen.dart';

//to add Custom scrool view
class ListOfCity extends StatefulWidget {
  final String push;

  ListOfCity({this.push});

  @override
  _ListOfCityState createState() => _ListOfCityState();
}

class _ListOfCityState extends State<ListOfCity> {
  bool isp = true;
  List<Repo> extraxt = [];
  ProviderData prov ;
  var _data={};

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  if(isp){
    prov=Provider.of<ProviderData>(context);
    prov.prefer=[];
    prov.data['countries'].forEach((key, value) {
      if (value['continent'] == widget.push) {
        prov.addRepoToPrefer(
          Repo(
            // index: i,
            native: value['native'],
            name: value['name'],
            currency: value['currency'],
            capital: value['capital'],
            continent: value['continent'],
            emoji: value['emoji'],
            emojiU: value['emojiU'],
            languages: value['languages'],
            phone: value['phone'],

          ),
        );

      }
    });
    // _data=Provider.of<ProviderData>(context).data;
   setState(() {
     isp=false;
   });

  }
  }

  @override
  Widget build(BuildContext context) {

print('sdadas');
    return Scaffold(
      backgroundColor: prov.isDark?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
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
      isp?Center(child: CircularProgressIndicator(),):
      ListView.builder(
        itemExtent: 60,
        itemBuilder: (context, i) {
print(prov.prefer.length.toString());
       //heo function wheer to add to prefer
         // print(prov.getPrefer().length.toString());
          return CardCity( data:prov.data,i: i);
        },
        itemCount: prov.prefer.length,
      ),
    );
  }
}


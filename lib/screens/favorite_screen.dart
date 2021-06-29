import 'package:delete/helper/provider.dart';
import 'package:delete/helper/repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Repo> favorite;

ProviderData prov;
bool isp=true;
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
if(isp){
  prov=Provider.of<ProviderData>(context,listen: false);
  prov.addRepoToFavorite();
  isp=false;
}
}
  @override
  Widget build(BuildContext context) {
var size =MediaQuery.of(context).size;
 return Scaffold(

   backgroundColor: prov.isDark?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,

   appBar: AppBar(
        backgroundColor:prov.isDark?Theme.of(context).primaryColor: Theme.of(context).accentColor,

      ),
      body:prov.favorite.length==0?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: SizedBox(
                  height: size.height/4,
                  child: Image.asset('images/waiting.png',fit: BoxFit.fitWidth,)),
            ),
            Text('no element favorite add yet'
            ,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color:prov.isDark?Colors.white60: Colors.indigo
              ),),
          ],
        ),
      ): ListView.builder(
        key: ValueKey('lll'),
        itemBuilder: (ctx,i){

        return  Container(
          key:ValueKey( prov.favorite[i].currency
          ,),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey,width: 2,)
          ),
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
          width: size.width,
          height: size.height/10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(prov.favorite[i].emoji,style: TextStyle(fontSize: 25),),
              ),
              Text('${prov.favorite[i].name}',style:TextStyle(color: prov.isDark?Colors.tealAccent:Colors.black)),
              Spacer(),
              IconButton(icon: Icon(Icons.delete,color: Colors.red,),
                onPressed: (){
                  setState(() {
                    prov.deleteFromFavorite(i,prov.favorite[i].name);
                  });
                },)

            ],
          ),
        );
      },itemCount:prov.favorite.length ,
      ),
    );
  }
}

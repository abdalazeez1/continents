import 'package:delete/helper/provider.dart';
import 'package:delete/helper/repo.dart';
import 'package:delete/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'heart.dart';

class CardCity extends StatelessWidget {
   CardCity({Key key, @required data, this.i})
      : _data = data,
        super(key: key);

   List<Repo> extraxt=[];
  final _data;
  final int i;
var prov=ProviderData();

  @override
  Widget build(BuildContext context) {
prov=Provider.of<ProviderData>(context);
    extraxt=prov.prefer;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
                  data: extraxt[i],
                  allData: _data,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
              colors: [
                Colors.red.withOpacity(0.8),
                Colors.amber.withOpacity(0.6),
                Color(0XFF125d98).withOpacity(0.8)
              ],
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10)),
          ),
          child: Row(
            children: [
              //add hero
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 2,
                ),
                child: Text(
                  extraxt[i].emoji,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          extraxt[i].name,
                          style: TextStyle(
                              fontSize: extraxt[i].name.length > 25 ? 12 : 16),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      "capital:${extraxt[i].capital}  ",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade50),
                    ),
                  ),
                ],
              ),
              Spacer(),
              // Heart(repo: i,)
           IconButton(
             icon: Icon(Icons.favorite),
             color: extraxt[i].favo?Colors.red:Colors.grey,
             onPressed: (){
               prov.setValueOfFavorite(!extraxt[i].favo, i);

             },
           )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:delete/helper/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ProviderData prov;

  TextEditingController controller = TextEditingController();
  var filter = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    prov = Provider.of<ProviderData>(context, listen: true);
    return Scaffold(
      backgroundColor: prov.isDark
          ? Theme.of(context).primaryColorDark
          : Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: prov.isDark
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (v) {
                    if (controller.text == '') {
                      setState(() {
                        prov.search = [];
                      });
                    }
                    prov.searchF(v);
                  },
                  style: TextStyle(color: prov.isDark? Colors.tealAccent:Colors.black54),
                  controller: controller,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: prov.isDark? Colors.tealAccent:Colors.black54,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter name to search',
                      hintStyle: TextStyle(color:prov.isDark? Colors.tealAccent:Colors.black54,fontSize: 12),
                      icon: Icon(Icons.search,color:prov.isDark? Colors.tealAccent:Colors.black54,),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),

                ),
              ),
              (prov.search.length==0||controller.text.isEmpty)?Center(
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
              ): Expanded(
                child: ListView.builder(
                    itemCount: prov.search.length,
                    itemBuilder: (ctx, i) {
                      return Container(
                        key: ValueKey(prov.getSearch()[i].currency),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            )),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        width: size.width,
                        height: size.height / 10,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                prov.getSearch()[i].emoji,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Text(prov.getSearch()[i].name,
                                style: TextStyle(
                                    color: prov.isDark
                                        ? Colors.tealAccent
                                        : Colors.black)),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

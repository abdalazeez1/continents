import 'package:delete/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var prov = ProviderData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    prov = Provider.of<ProviderData>(context);
    return Drawer(
      elevation: 20,

      child: Container(
        color: prov.isDark?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,

        child: Column(

          children: [
          SizedBox(
            height: size.height/4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: prov.isDark?Theme.of(context).primaryColorLight:Colors.indigo,
                child: FlutterLogo(),
                radius: size.width/8,
              ),
            ),
          ),
            Divider(thickness: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  Text(
                    'change mode ',
                    style: TextStyle(
                      color: prov.isDark?Colors.tealAccent:Colors.black
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: prov.isDark,
                    onChanged: (val) {
                      setState(
                        () {
                          prov.setDark(val);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height/8,
            ),
            Center(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                  height: size.height/3,
                  child: Image.asset('images/drawer.png')),
            ))
          ],
        ),
      ),
    );
  }
}

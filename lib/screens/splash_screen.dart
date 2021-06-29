import 'dart:async';

import 'package:delete/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ProviderData prov ;
  bool isp=true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  if(isp){
    Timer(Duration(seconds: 2),()async{
      prov=Provider.of<ProviderData>(context,listen: false);
      await prov.loadJsonData();
      prov.data['continents'].forEach((key, value) {
        prov.extract.add(value);});
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    isp=false;
  }
  }



//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     Timer(Duration(seconds: 2),()async{
//       prov=Provider.of<ProviderData>(context);
//       await prov.loadJsonData();
//       prov.data['continents'].forEach((key, value) {
//         prov.extract.add(value);});
//   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
// });
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Image.asset('images/splash.png'),
      ),
    );
  }
}

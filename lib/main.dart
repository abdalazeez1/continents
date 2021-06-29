import 'package:delete/helper/provider.dart';
import 'package:delete/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider.value(
    value: ProviderData(),
    builder: (ctx,child)=>
    MaterialApp(
      theme: ThemeData(
        //dark
        // primaryColorLight:Color(0XFFFAF1E6) ,
        // accentColor:Color(0XFFE4EFE7) ,
        primaryColorLight:Color( 0XFFA2DBFA) ,
        accentColor:Color(0XFFF39A2DB) ,


        //this for dark appbar  body
        primaryColor:Color(0xff053742),
       primaryColorDark:Color(0XFF03256C),

      ),

      home: SplashScreen(),
    ),
  ));
}




import 'package:delete/helper/provider.dart';
import 'package:delete/helper/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({
    Key key,
    @required this.size,
    @required this.data,
    @required this.title,
    @required this.subT,
    @required this.icon,
    this.isCenter = false,
  }) : super(key: key);
  final String title;
  final String subT;
  final Size size;
  final Repo data;
  final Icon icon;
  final bool isCenter;
  var prov;

  @override
  Widget build(BuildContext context) {
    prov = Provider.of<ProviderData>(context).isDark;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: size.height / 10,
      width: isCenter ? size.width / 0.3 : size.width / 3,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(title,style: TextStyle(
                    fontSize: (title.length>19&&isCenter==false)?10:16
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: icon,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    subT,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: size.width / 11,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: prov ? Color(0XFF77ACF1) : Color(0XFFC0FEFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
    );
  }
}

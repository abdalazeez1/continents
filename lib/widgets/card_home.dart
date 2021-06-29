import 'package:delete/screens/list_city.dart';
import 'package:flutter/material.dart';

class CardHome extends StatelessWidget {
  final String text;
  final Size size;
  final String push;

  CardHome({this.text, this.size, this.push});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4 + size.height / 36,
      width: size.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListOfCity(
                  push: push,
                ),
              ),
            );
          },
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Image.asset(
                  'images/a1.jpeg',
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [
                        Colors.red.withOpacity(0.6),
                        Colors.amber.withOpacity(0.6),
                        Colors.blueAccent.withOpacity(0.6)
                      ],
                    ),
                  ),
                  height: size.height / 20,
                  child: Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

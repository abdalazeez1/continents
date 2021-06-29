import 'package:delete/helper/provider.dart';
import 'package:delete/helper/repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Heart extends StatefulWidget {
final int repo;
final prov;
  Heart({this.repo, this.prov});

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;
  AnimationController _controller;
  Animation _colorAnimation;
  Animation _sizeAnimation;
  var prov=ProviderData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);
    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
        TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50),
      ],
    ).animate(_controller);
    _controller.forward();
    _controller.addListener(() {});
    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFav = true;

          });
        } else {
          setState(
            () {
              isFav = false;

            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
// print(prov.prefer[widget.repo].favo);
            prov.setValueOfFavorite(isFav, widget.repo);
            },
        );
      },
    );
  }
}

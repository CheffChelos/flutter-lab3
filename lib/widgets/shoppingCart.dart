import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  final val;

  Cart({@required this.val});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          child: Bubble(counter: val),
          alignment: Alignment.topRight,
        ),
        Align(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.black12,
          ),
        )
      ],
    );
  }
}

class Bubble extends StatelessWidget {
  final int counter;

  Bubble({this.counter});

  @override
  Widget build(BuildContext context) => counter != 0
      ? CircleAvatar(
          backgroundColor: Colors.pink,
          child: Text('$counter', style: TextStyle(color: Colors.white),),
          radius: 9,
        )
      : Container();
}

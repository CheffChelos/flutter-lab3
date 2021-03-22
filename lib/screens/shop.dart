import 'package:flutter/material.dart';
import '../widgets/shoppingCart.dart';
import '../widgets/shoppingBody.dart';

class ShoppingApp extends StatefulWidget {
  @override
  _ShoppingAppState createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  int count = 0;

  void addToCart() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black12,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.black12,
              ),
              IconButton(
                icon: Cart(val: count),
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Body(
            callback: addToCart,
          ),
        ),
      ),
    );
  }
}

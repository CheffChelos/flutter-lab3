import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final Function callback;
  Body({this.callback});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/JsonFiles/goods.json"),
        builder: (context, snapshot) {
          List data = jsonDecode(snapshot.data.toString());
          if (snapshot.connectionState == ConnectionState.done) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                mainAxisExtent: 235,
              ),
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Card(
                obj: data[index],
                callback: widget.callback,
              ),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}

class Card extends StatelessWidget {
  final obj;
  final Function callback;

  Card({this.obj, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.teal,
              ),
              child: Center(
                child: Image.asset(
                  '${obj["path"]}',
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text('${obj["name"]}'),
                subtitle: Text('${obj["price"]}'),
                trailing: IconButton(
                  icon: Icon(Icons.add_circle_outlined),
                  highlightColor: Colors.pink,
                  onPressed: callback,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

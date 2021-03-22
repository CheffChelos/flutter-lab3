import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Scaffold(
            body: Center(
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () => _increment(),
                    child: Icon(Icons.add),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () => _decrement(),
                    child: Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/colorModel.dart';

class HomePageConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorModel>(
      create: (context) => ColorModel(),
      child: Consumer<ColorModel>(
        builder: (context, model, _) => MaterialApp(
          builder: (context, _) {
            double _height = MediaQuery.of(context).size.height;
            return Scaffold(
              body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  color: model.getColor,
                  height: _height,
                  child: Center(
                    child: Text(
                      'Tap anywhere',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                onTap: model.colorUpdate,
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePageOf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorModel>(
      create: (context) => ColorModel(),
      child: MaterialApp(
        builder: (context, _) => Scaffold(
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: context.read<ColorModel>().getColor,
              child: Center(
                child: Text(
                  'Tap anywhere',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            onTap: context.watch<ColorModel>().colorUpdate,
          ),
        ),
      ),
    );
  }
}

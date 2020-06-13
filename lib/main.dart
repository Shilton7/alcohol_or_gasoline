import 'package:alcohol_or_gasoline/widgets/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:alcohol_or_gasoline/widgets/logo.widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasolinaCtrl = new MoneyMaskedTextController();
  var _alcoolCtrl = new MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: <Widget>[
            Logo(),
            Input(inputLabel: "Álcool", inputCtrl: _alcoolCtrl),
            Input(inputLabel: "Gasolina", inputCtrl: _gasolinaCtrl),
          ],
        ));
  }
}

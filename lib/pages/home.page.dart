import 'package:alcohol_or_gasoline/widgets/form-submit.dart';
import 'package:alcohol_or_gasoline/widgets/logo.widget.dart';
import 'package:alcohol_or_gasoline/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gasolinaCtrl = new MoneyMaskedTextController();
  var _alcoolCtrl = new MoneyMaskedTextController();
  var _loading = false;
  var _exibirResultado = false;
  var _resultText = "";
  Color _color = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _exibirResultado
                ? Success(
                    result: _resultText,
                    action: resetForm,
                  )
                : FormSubmit(
                    alcoolCtrl: _alcoolCtrl,
                    gasolinaCtrl: _gasolinaCtrl,
                    action: calculate,
                    loading: _loading,
                  )
          ],
        ),
      ),
    );
  }

  Future calculate() {
    if (_alcoolCtrl.text != "0,00" && _gasolinaCtrl.text != "0,00") {
      double alcool =
          double.parse(_alcoolCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) /
              100;

      double gasolina =
          double.parse(_gasolinaCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) /
              100;

      double res = alcool / gasolina;

      setState(() {
        _exibirResultado = false;
        _loading = true;
        _color = Colors.deepPurpleAccent;
      });

      return new Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          if (res >= 0.7) {
            _resultText = "Compensa utilizar Gasolina!";
          } else {
            _resultText = "Compensa utilizar Álcool!";
          }

          _exibirResultado = true;
          _loading = false;
        });
      });
    }
  }

  resetForm() {
    setState(() {
      _alcoolCtrl = new MoneyMaskedTextController();
      _gasolinaCtrl = new MoneyMaskedTextController();
      _loading = false;
      _exibirResultado = false;
      _color = Colors.deepPurple;
    });
  }
}

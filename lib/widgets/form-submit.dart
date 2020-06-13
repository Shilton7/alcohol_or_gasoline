import 'package:alcohol_or_gasoline/widgets/input.widget.dart';
import 'package:alcohol_or_gasoline/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class FormSubmit extends StatelessWidget {
  var gasolinaCtrl = new MoneyMaskedTextController();
  var alcoolCtrl = new MoneyMaskedTextController();
  var loading = false;
  Function action;

  FormSubmit({
    @required this.gasolinaCtrl,
    @required this.alcoolCtrl,
    @required this.loading,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            inputLabel: "Gasolina",
            inputCtrl: gasolinaCtrl,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            inputLabel: "Álcool",
            inputCtrl: alcoolCtrl,
          ),
        ),
        LoadingButton(
          loading: loading,
          invertColor: false,
          labelButton: "Calcular",
          funcButton: action,
        ),
      ],
    );
  }
}

import 'package:alcohol_or_gasoline/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  var result = "";
  Function action;

  Success({
    @required this.result,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: "Big Shoulders Display",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
              loading: false,
              invertColor: true,
              labelButton: "Calcular Novamente",
              funcButton: action),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var loading = false;
  var invertColor = false;
  var labelButton = "";
  Function funcButton;

  LoadingButton({
    @required this.loading,
    @required this.invertColor,
    @required this.labelButton,
    @required this.funcButton,
  });

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(backgroundColor: Colors.white),
          )
        : Container(
            margin: EdgeInsets.all(50),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: invertColor
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.80),
                borderRadius: BorderRadius.circular(
                  60,
                )),
            child: FlatButton(
              child: Text(
                labelButton,
                style: TextStyle(
                  color: invertColor
                      ? Colors.white.withOpacity(0.80)
                      : Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontFamily: "Big Shoulders Display",
                ),
              ),
              onPressed: funcButton,
            ),
          );
  }
}

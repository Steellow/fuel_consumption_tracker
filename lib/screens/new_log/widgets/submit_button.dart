import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';

class SubmitButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;

  SubmitButton(this.formkey);

  @override
  _SubmitButtonState createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: RaisedButton(
            color: Colors.indigo,
            shape: Styles.roundShape,
            onPressed: () {
              if(widget.formkey.currentState.validate()) {
                print("aASDFASDF");
              }
            },
            child: Container(
              margin: EdgeInsets.all(12),
              child: Text('Submit', style: Styles.whiteBold.copyWith(fontSize: 24)),
            ),
          ),
        ),
      ),
    );
  }
}

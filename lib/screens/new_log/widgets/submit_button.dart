import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/models/log.dart';
import 'package:fuel_consumption_tracker/util/styles.dart';
import 'package:hive/hive.dart';

class SubmitButton extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final TextEditingController fuelFormController;
  final TextEditingController odometerFormController;

  SubmitButton(this.formkey, this.fuelFormController, this.odometerFormController);

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
              if (widget.formkey.currentState.validate()) {
                print(double.parse(widget.fuelFormController.text));
                print(int.parse(widget.odometerFormController.text));

                // ! SOME ERROR HANDLING HERE
                final Log log = Log(
                  DateTime.now(),
                  double.parse(widget.fuelFormController.text),
                  int.parse(widget.odometerFormController.text),
                );

                saveLog(log);
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

  void saveLog(Log log) {
    final logBox = Hive.box('logs');
    logBox.add(log);
    print("saveLog succee?")  ;
  }
}

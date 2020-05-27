import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceCodeTile extends StatefulWidget {
  @override
  _SourceCodeTileState createState() => _SourceCodeTileState();
}

class _SourceCodeTileState extends State<SourceCodeTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          _launchURL();
        });
      },
      leading: CenterIcon(Icon(MdiIcons.github)),
      title: Text("Source code"),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/Steellow/fuel_consumption_tracker';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: "Can't open url");
      throw 'Could not launch $url';
    }
  }
}

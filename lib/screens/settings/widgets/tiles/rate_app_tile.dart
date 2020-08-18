import 'package:flutter/material.dart';
import 'package:fuel_consumption_tracker/screens/shared_widgets/center_icon.dart';
import 'package:store_redirect/store_redirect.dart';

class RateAppTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        StoreRedirect.redirect(androidAppId: 'labs.ankia.fuel_consumption_tracker');
      },
      leading: CenterIcon(Icon(Icons.star)),
      title: Text("Rate app"),
    );
  }
}

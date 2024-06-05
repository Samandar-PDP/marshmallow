import 'package:flutter/cupertino.dart';

void navigate(BuildContext context, Widget to) {
  Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => to));
}
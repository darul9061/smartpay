import 'package:flutter/material.dart';

Future<bool> showDataDialog(BuildContext context, String info) async {
  showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              content: Container(
                child: Center(
                  child: Text(info),
                ),
              ),
            ));
      });

  return await Future.delayed(Duration(milliseconds: 3000), () {
    Navigator.pop(context);
    return true;
  });
}

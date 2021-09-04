import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Utils {
  static void showAlertDialog(BuildContext context, String msg) {
    AlertDialog alertDialog = AlertDialog(
      title: Text("Mensaje del servidor"),
      content: Text(msg),
      elevation: 10.0,
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  static ProgressDialog showProgressDialog(BuildContext context) {
    ProgressDialog pb = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pb.style(
        message: 'Cargando...',
        borderRadius: 10.0,
        elevation: 10.0,
        progressWidget: Container(
            padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()));
    return pb;
  }
}

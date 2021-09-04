//@dart=2.9

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/services.dart';
import 'package:image_masking/Presenter/PresenterLoginMVP.dart';

class ModelLoginMVP {
  PresenterLoginMVP presenterLoginMVP;

  ModelLoginMVP(this.presenterLoginMVP);

  void requestModelValidateLogin(String emailTxt, String passTxt) {
    if (emailTxt.isEmpty || passTxt.isEmpty) {
      presenterLoginMVP.notifyViewShowErrorMsg("Debe llenar todos los campos");
    } else {
      presenterLoginMVP.notifyViewShowPDialog();
      Backendless.userService.login(emailTxt, passTxt, true).then((user) {
        presenterLoginMVP.notifyViewCLosePDialog();
        print("Suucessfully user logeeedIn: " + user.email);
      }, onError: (e) {
        PlatformException platformException = e;
        String msgError = platformException.message;
        presenterLoginMVP.notifyViewCLosePDialog();
        presenterLoginMVP.notifyViewShowErrorMsg(msgError);
      });
    }
  }
}

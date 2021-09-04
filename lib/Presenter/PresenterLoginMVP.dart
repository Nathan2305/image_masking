import 'package:image_masking/Model/ModelLoginMVP.dart';
import 'package:image_masking/View/ViewLoginMVP.dart';

class PresenterLoginMVP {
  ModelLoginMVP? modelLoginMVP;
  ViewLoginMVP viewLoginMVP;

  PresenterLoginMVP(this.viewLoginMVP) {
    this.modelLoginMVP = ModelLoginMVP(this);
  }

  void isValidLogin(String emailTxt, String passTxt) {
    modelLoginMVP!.requestModelValidateLogin(emailTxt,passTxt);
  }

  void notifyViewShowErrorMsg(String msgError) {
    viewLoginMVP.notifyViewShowErrorMsg(msgError);
  }

  void notifyViewShowPDialog() {
    viewLoginMVP.notifyViewShowPDialog();
  }

  void notifyViewCLosePDialog() {
    viewLoginMVP.notifyViewCLosePDialog();
  }
}

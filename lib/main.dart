//@dart=2.9

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_masking/Presenter/PresenterLoginMVP.dart';
import 'package:image_masking/Tools/Utils.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'View/ViewLoginMVP.dart';

var controllerEmail;
var controllerPasswd;
BuildContext fullContext;
PresenterLoginMVP presenterLogin;
List<Color> _colors;
ProgressDialog pb;

void main() {
  runApp(MyApp());
  _colors = [Colors.deepOrange, Colors.yellow];
  controllerEmail = TextEditingController();
  controllerPasswd = TextEditingController();
  presenterLogin = PresenterLoginMVP(LoginScreen());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Backendless.initApp(
        "C53D7BF1-EC61-A11B-FF18-31BAED0CB500",
        "DB303CEE-4604-43D7-8FE6-D8ACA6B45FF5",
        "C8E9E135-C284-49C9-BFFC-CC95F85705A1");
    return MaterialApp(
        color: Colors.red,
        title: '1st App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen());
  }
}

class TextFieldEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: controllerEmail,
      style: TextStyle(
        color: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.orange),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: controllerPasswd,
      style: TextStyle(
        color: Colors.white,
      ),
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.orange),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: () {
          validateLogin();
        },
        style: TextButton.styleFrom(
          elevation: 10,
          padding: const EdgeInsets.all(10.0),
          backgroundColor: Colors.deepOrange,
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 18),
        ),
        child: const Text('Ingresar'));
  }

  void validateLogin() {
    String emailTxt = controllerEmail.text;
    String passlTxt = controllerPasswd.text;
    presenterLogin.isValidLogin(emailTxt, passlTxt);
  }
}

class AlignChildTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text('Login',
              textScaleFactor: 2, style: TextStyle(color: Colors.white)),
        ));
  }
}

class AlignChildUserPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: TextFieldEmail(),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
          ),
          Container(
            child: TextFieldPassword(),
            margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          )
        ],
      ),
    );
  }
}

class AlignChildBtnLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: ButtonLogin(),
      ),
    );
  }
}

class CardLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        elevation: 10,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              gradient: LinearGradient(
                colors: _colors,
              )),
          child: Stack(
            children: [
              AlignChildTitle(),
              AlignChildUserPass(),
              AlignChildBtnLogin(),
            ],
          ),
        ));
  }
}

class LoginScreen extends StatelessWidget implements ViewLoginMVP {
  @override
  Widget build(BuildContext context) {
    fullContext = context;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: _colors,
      )),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: _colors,
          )),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: (Image(
                  image: AssetImage('assets/nino.jpg'),
                  height: MediaQuery.of(context).size.height * 0.25,
                )),
              ),
              CardLogin(),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void notifyViewShowErrorMsg(String msgError) {
    Utils.showAlertDialog(fullContext, msgError);
  }

  @override
  void notifyViewShowPDialog() {
    pb = Utils.showProgressDialog(fullContext);
    pb.show();
    // TODO: implement notifyViewShowPDialog
  }

  @override
  void notifyViewCLosePDialog() {
    if (pb != null) {
      pb.hide();
    }
  }
}

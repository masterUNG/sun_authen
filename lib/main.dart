import 'package:flutter/material.dart';
import 'screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sun Authen',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final _scaffold = GlobalKey<ScaffoldState>();

  String emailString, passwordString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        body: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 50.0),
                child: logoShow(),
              ),
              Container(
                alignment: Alignment.center,
                child: titleApp(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: emailTextField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 15.0),
                child: passwordTextField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: Container(
                        child: signInButton(context),
                      ),
                    ),
                    new Expanded(
                      child: Container(
                        child: signUpButton(context),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget testText() {
    return Text('textText');
  }

  Widget logoShow() {
    return Image.asset('images/logo.png');
  }

  Widget titleApp() {
    return Text(
      'Sun Authen',
      style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'DancingScript',
          fontWeight: FontWeight.bold,
          color: Colors.blue[700]),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email Address:', hintText: 'you@email.com'),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'False Email Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password:', hintText: 'more 5 Charactor'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Password must more 5 Charator';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget signInButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blue[400],
      child: Text(
        'SignIn',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignIn');
        // print(formKey.currentState.validate());
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkEmailAndPass(context, emailString, passwordString);
        }
      },
    );
  }

  void checkEmailAndPass(
      BuildContext context, String email, String password) async {
    print('email ==> $email, password ==> $password');

    String urlString =
        'https://www.androidthai.in.th/sun/getUserWhereUserMaster.php?isAdd=true&User=$email';

    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result ==> $result');

    if (result.toString() == 'null') {
      showSnackBar('User False');
    } else {
      
    }
  }

  void showSnackBar(String messageString) {
    final snackBar = new SnackBar(
      content: Text(messageString),
      backgroundColor: Colors.orange,
      duration: new Duration(seconds: 8),
      action: new SnackBarAction(
        label: 'Please Click',
        onPressed: () {
          print('You Click SnackBar');
        },
      ),
    );
    _scaffold.currentState.showSnackBar(snackBar);
  }

  Widget signUpButton(BuildContext context) {
    return RaisedButton(
      color: Colors.blue[300],
      child: Text(
        'SignUp',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignUp');
        var myRounte = new MaterialPageRoute(
          builder: (BuildContext context) => Register(),
        );
        Navigator.of(context).push(myRounte);
      },
    );
  }
} // _HomePageState

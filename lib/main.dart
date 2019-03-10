import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'screens/register.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: signInButton(),
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
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.blue[400],
      child: Text(
        'SignIn',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignIn');
        print(formKey.currentState.validate());
      },
    );
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

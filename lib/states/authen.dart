import 'package:carebmi/utility/my_style.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
          ),
          Text(
            ' No Account ?',
            style: MyStyle().normalTextStyle(),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/createAcount'),
            child: Text(
              'Create Account',
              style: MyStyle().activeTextStyle(),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.35),
            radius: 1,
            colors: [Colors.white, MyStyle().darkColor],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildLogo(context),
              buildAppName().showTitle('Care BMI'),
              buildUser(context),
              buildPassword(context),
              buildLogin(context),
              buildForgotPassword()
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildForgotPassword() => TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password',
          style: MyStyle().activeTextStyle(),
        ),
      );

  Container buildLogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        style: MyStyle().buttonStyle(),
        onPressed: () {},
        child: Text('Login'),
      ),
    );
  }

  Container buildUser(BuildContext context) {
    return Container(
      decoration: MyStyle().whiteBoxDecoration(),
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        decoration: MyStyle().myInputDecoration(Icons.perm_identity, 'User'),
      ),
    );
  }

  Container buildPassword(BuildContext context) {
    return Container(
      decoration: MyStyle().whiteBoxDecoration(),
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        decoration: MyStyle().myInputDecoration(
          Icons.lock_outline,
          'Password',
          redEye: true,
        ),
      ),
    );
  }

  MyStyle buildAppName() => MyStyle();

  Container buildLogo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      child: MyStyle().showLogo(),
    );
  }
}

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLogo(context),
            buildAppName().showTitle('Care BMI'),
            buildUser(context),
            buildPassword(context),
          ],
        ),
      ),
    );
  }

  Container buildUser(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        decoration: MyStyle().myInputDecoration(Icons.perm_identity, 'User'),
      ),
    );
  }

  Container buildPassword(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        decoration: MyStyle().myInputDecoration(
          Icons.lock_outline,
          'Password',
          subfixIconData: Icons.remove_red_eye_outlined,
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

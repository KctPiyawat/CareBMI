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
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextFormField(
                decoration: MyStyle().myInputDecoration(),
              ),
            ),
          ],
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

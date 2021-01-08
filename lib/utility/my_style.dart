import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0xff2e9100);
  Color primaryColor = Color(0xff67c20d);
  Color lightColor = Color(0xff9cf54e);

  Widget showLogo() => Image.asset('images/logo.png');

  Widget showTitle(String string) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(string,
            style: TextStyle(
              color: darkColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );

  InputDecoration myInputDecoration(IconData iconData, String string, {IconData subfixIconData}) =>
      InputDecoration(
        hintStyle: TextStyle(color: darkColor),
        hintText: string,
        prefixIcon: Icon(iconData,color: darkColor,),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkColor),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightColor),
          borderRadius: BorderRadius.circular(30),
        ),
      );

  MyStyle();
}

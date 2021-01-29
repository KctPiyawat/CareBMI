import 'package:carebmi/utility/my_style.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String typeUser;

  Container buildDisplayName(BuildContext context) {
    return Container(
      decoration: MyStyle().whiteBoxDecoration(),
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        decoration:
            MyStyle().myInputDecoration(Icons.fingerprint, 'Display Name :'),
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
        obscureText: true,
        decoration: MyStyle().myInputDecoration(
          Icons.lock_outline,
          'Password :',
        ),
      ),
    );
  }

  Container buildRePassword(BuildContext context) {
    return Container(
      decoration: MyStyle().whiteBoxDecoration(),
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        obscureText: true,
        decoration: MyStyle().myInputDecoration(
          Icons.lock_outline,
          'Re-Password : ',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primaryColor,
        title: Text('Create Accout'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildDisplayName(context),
              Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(width: MediaQuery.of(context).size.width*0.6,
                    child: RadioListTile(
                      value: 'user',
                      groupValue: typeUser,
                      onChanged: (value) {
                        setState(() {
                          typeUser = value;
                        });
                      },
                      title: Text('User'),
                      subtitle: Text('หมายถึง User ทั่วไป'),
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width*0.6,
                    child: RadioListTile(
                      value: 'trainner',
                      groupValue: typeUser,
                      onChanged: (value) {
                        setState(() {
                          typeUser = value;
                        });
                      },
                      title: Text('Trainner'),
                      subtitle: Text('Trainner ที่ดูแล User'),
                    ),
                  ),
                ],
              ),
              buildUser(context),
              buildPassword(context),
              buildRePassword(context),
            ],
          ),
        ),
      ),
    );
  }
}

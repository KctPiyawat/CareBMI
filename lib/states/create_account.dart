import 'package:carebmi/utility/dialog.dart';
import 'package:carebmi/utility/my_style.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String typeUser, name, user, password, repassword;
  final formKey = GlobalKey<FormState>();
  bool statusRadio = true, redEyePass = true, redEyeRePass = true;

  Container buildDisplayName(BuildContext context) {
    return Container(
      decoration: MyStyle().whiteBoxDecoration(),
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Fill Display Name';
          } else {
            return null;
          }
        },
        onSaved: (newValue) => name = newValue.trim(),
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
        onSaved: (newValue) => user = newValue.trim(),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please Fill User in Blank';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
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
        onChanged: (newValue) => password = newValue.trim(),
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please Fill Password in Blank';
          } else {
            return null;
          }
        },
        obscureText: redEyePass,
        decoration: MyStyle().myInputDecoration(
            Icons.lock_outline, 'Password :',
            redEye: redEyeRePass),
      ),
    );
  }

  Container buildRePassword(BuildContext context) {
    return Container(
      decoration: MyStyle().whiteBoxDecoration(),
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Please Fill RePassword in Blank';
          } else if (value != password) {
            return 'Password And RePassword Not Math';
          } else {
            return null;
          }
        },
        obscureText: redEyeRePass,
        decoration: MyStyle().myInputDecoration(
          Icons.lock_outline,
          'Re-Password : ',
          redEye: redEyeRePass,
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildDisplayName(context),
                buildTypeUser(context),
                statusRadio ? SizedBox() : buildValidateRadio(context),
                buildUser(context),
                buildPassword(context),
                buildRePassword(context),
                buildCreateAccount(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildValidateRadio(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.red,
            thickness: 1.0,
          ),
          Text(
            'Please Choose Type User',
            style: TextStyle(
              color: Colors.red[700],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Container buildCreateAccount(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        style: MyStyle().buttonStyle(),
        onPressed: () {
          if (formKey.currentState.validate() && typeUser != null) {
            formKey.currentState.save();
          }
          if (typeUser == null) {
            setState(() {
              statusRadio = false;
            });
          } else {
            setState(() {
              statusRadio = true;
            });
          }
        },
        child: Text('Create Acconut'),
      ),
    );
  }

  Column buildTypeUser(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
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
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
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
    );
  }
}

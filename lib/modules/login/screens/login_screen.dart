import 'package:flutter/material.dart';
import 'package:flutter_assignment/common/utilities/colors_utility.dart';
import 'package:flutter_assignment/common/utilities/navigator_utility.dart';
import 'package:flutter_assignment/common/utilities/strings/value_string.dart';
import 'package:flutter_assignment/common/utilities/text_style_utility.dart';
import 'package:flutter_assignment/common/utilities/util.dart';
import 'package:flutter_assignment/common/widgets/common_text_button_widget.dart';
import 'package:flutter_assignment/common/widgets/common_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String _userName = 'admin';
  final String _password = 'password';
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String userName = _userNameController.text.trim();
    String password = _passwordController.text.trim();

    if (userName == _userName && password == _password) {
      NavigatorUtility().navigateToProfileScreen(context);
    } else {
      // Show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: buildHeight(context) * 0.30,
            ),
            Text(
              ValueString.loginText,
              style: TextStyleUtility.commonTextStyle(context,
                  ColorsUtility.primaryBlackColor, 22.0, FontWeight.bold),
            ),
            SizedBox(
              height: buildHeight(context) * 0.04,
            ),
            CommonTextFormField(
              controller: _userNameController,
              hintText: ValueString.userNameText,
            ),
            SizedBox(
              height: buildHeight(context) * 0.03,
            ),
            CommonTextFormField(
              controller: _passwordController,
              hintText: ValueString.passwordText,
            ),
            SizedBox(
              height: buildHeight(context) * 0.05,
            ),
            CommonTextButtonWidget(
                isIcon: false,
                height: buildHeight(context) * 0.06,
                width: buildWidth(context) * 0.90,
                title: ValueString.loginText,
                titleFontSize: 14.0,
                titleFontWeight: FontWeight.w600,
                onPressed: () {
                  _login();
                }),
          ],
        ),
      ),
    ));
  }
}

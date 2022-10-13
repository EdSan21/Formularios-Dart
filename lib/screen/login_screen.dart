import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:formulariologin/providers/login_form_provider.dart';
import 'package:formulariologin/widgets/auth_background.dart';
import 'package:formulariologin/widgets/card_container.dart';
// import 'package:formulariologin/screen/screens.dart';
import 'package:formulariologin/ui/input_decorations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 250),
            CardContainer(
              child: Column(children: [
                SizedBox(height: 10),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (__) => LoginFormProvider(), child: _LoginForm())
              ]),
            ),
            SizedBox(height: 50),
            Text(
              'Crear una cuenta nueva',
              style: TextStyle(fontSize: 45),
            )
          ]),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            // decoration: InputDecorations.authInputDecoration,
          )
        ]),
      ),
    );
  }
}

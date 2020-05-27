import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' REGISTRO '),
      ),
      body: Form(
        key: _formKey,
        
        child: Column(
          children: <Widget>[
            
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'nombre'),
              validator: (input) {
                if (input.isEmpty) {
                  return 'por favor, escriba su nombre';
                }
              },
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (input) {
                if (input.isEmpty) {
                  return 'por favor, escriba su Email';
                }
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              validator: (input) {
                if (input.isEmpty) {
                  return 'por favor, escriba su Contraseña';
                }
              },
            ),
            RaisedButton(
              child: Text('SignUp'),
              onPressed: () {
                *if (_formKey.currentState.validate()) {
                  DBHelper dbHelper = DBHelper();
                  dbHelper.saveUser(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  Navigator.pushReplacementNamed(context, '/login');
                  Navigator.pop(context);
                } 
              },
            ),
          ],
        ),
      ),
    );
  }
}

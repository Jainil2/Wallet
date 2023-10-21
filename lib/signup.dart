import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet/auth.dart';

class Register extends StatefulWidget {
  // const Register({Key? key}) : super(key: key);
  final Function toggleView;
  const Register({super.key,required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>(); 

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text('Register in to Wallet'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Sign in'),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
              child: Column(
            children: [
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Enter a passeord with 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0))),
                ),
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                          print(email);
                          print(password);
                    }
                  }
                },
                child: const Text('Register',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              )
            ],
          ))),
    );
  }
}
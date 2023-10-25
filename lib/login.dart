// import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet/auth.dart';
import 'Shared/constants.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key? key}) : super(key: key);

  // final Function toggleView;
  // SignIn({super.key,required this.toggleView});
  // final toggleView;
  // const SignIn({Key? key, this.toggleView}) : super(key: key);
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text('Sign in to Wallet'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(Icons.person),
            label: const Text('Register'),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              child: Column(
            children: [
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
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
                  if (kDebugMode) {
                    print(email);
                    print(password);
                  }
                },
                child: const Text('Sign in',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              )
            ],
          ))),
    );
  }
}

// ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(Colors.black),
//             shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0))),
//           ),
//           onPressed: () async {
//             dynamic result = await _auth.signInAnon();
//             if(result == null) {
//               if (kDebugMode) {
//                 print('error in sign in');
//               }
//             }
//             else {
//               if (kDebugMode) {
//                 print('sign in successful');
//                 print(result.uid);
//               }
//             }
//           },
//           child: const Text('Sign in anon',
//           style: TextStyle(

//           ),),
//         ),

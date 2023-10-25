// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet/services/auth.dart';
import 'Shared/constants.dart';
import 'package:wallet/Shared/loading.dart';


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
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() :  Scaffold(
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
              key: _formKey,
              child: Column(
            children: [
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
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
                   if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        
                        if (result == null) {
                          setState(() {
                            error = 'please enter a valid email and password';
                            loading = false;
                          });
                        }
                        // if (kDebugMode) {
                        //       print(email);
                        //       print(password);
                        // }
                      }
                  // if (kDebugMode) {
                  //   print(email);
                  //   print(password);
                  // }
                },
                child: const Text('Sign in',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                          height: 12.0,
                        ),
                        Text(error,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 14.0))
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

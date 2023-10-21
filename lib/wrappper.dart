// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/authantication.dart';
import 'package:wallet/models/user.dart';
import 'package:wallet/pages/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users?>(context);
    // if (kDebugMode) {
    //   print(user);
    // }
    if(user == null) {
      return const Authanticate();
    } else {
      return const HomePage();
    }
    // return const HomePage();
  }
}
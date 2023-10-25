import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {

final String? uid;
  DatabaseService({ this.uid});

  // collection reference
  final CollectionReference walletCollection = FirebaseFirestore.instance.collection('wallet'); 

  Future updateUserData(int money, String name, String type) async {
    TimeOfDay timeOfDay = TimeOfDay.now();
    DateTime time = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, timeOfDay.hour, timeOfDay.minute);

    return await walletCollection.doc(uid).set({
      'moneyTransferred': money,
      'date': DateTime.now(),
      'name': name,
      'type': type,
      'time': time,
    });
  }
}
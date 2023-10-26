import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WalletList extends StatefulWidget {
  const WalletList({super.key});

  @override
  State<WalletList> createState() => _WalletListState();
}

class _WalletListState extends State<WalletList> {
  @override
  Widget build(BuildContext context) {

    final wallet = Provider.of<QuerySnapshot>(context);
    // print(wallet);
    for (var doc in wallet.docs) {
      print(doc);
    }

    return const Placeholder();
  }
}

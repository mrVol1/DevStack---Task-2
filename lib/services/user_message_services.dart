import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UserMessage {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void initState() {
    initFirebase();
  }

  Future sendMessage(BuildContext context, String message) async {
    return await FirebaseFirestore.instance
        .collection('Task2')
        .doc('main')
        .collection('messages')
        .add(
      {'message': message},
    );
  }
}

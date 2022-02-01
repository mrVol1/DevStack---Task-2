import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreatNewUsers {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void initState() {
    initFirebase();
  }

  Future createUsers(BuildContext context, String nickname, String name,
      String surname, String phone) async {
    return await FirebaseFirestore.instance
        .collection('Task2')
        .doc('main')
        .collection('users')
        .add(
      {
        'User Nickname': nickname,
        'User Name': name,
        'User Surname': surname,
        'User Phone': phone
      },
    );
  }
}

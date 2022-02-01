import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task2/screens/chat.dart';

class UserChatServices {
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  void initState() {
    initFirebase();
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Task2')
          .doc('main')
          .collection('users')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('No user');
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, i) {
            return Card(
              key: Key(
                snapshot.data!.docs[i].id,
              ),
              child: ListTile(
                onTap: () {
                  Route route = MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  );
                  Navigator.push(context, route);
                },
                title: Text(
                  snapshot.data!.docs[i].get('User Nickname'),
                ),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/botfather.png',
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

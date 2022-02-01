import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task2/screens/edit_user_info.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Route route = MaterialPageRoute(
                builder: (context) => const EditUserInfo(),
              );
              Navigator.push(context, route);
            },
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: const UserInfoList(),
    );
  }
}

class UserInfoList extends StatelessWidget {
  const UserInfoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Task2')
          .doc('main')
          .collection('users')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('No update');
        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('Nickname:'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data!.docs[i].get('User Nickname'),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text('Name:'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data!.docs[i].get('User Name'),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text('Surname:'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data!.docs[i].get('User Surname'),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text('Phone:'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        snapshot.data!.docs[i].get('User Phone'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

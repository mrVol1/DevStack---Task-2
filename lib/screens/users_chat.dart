import 'package:flutter/material.dart';
import 'package:task2/screens/create_users.dart';
import 'package:task2/services/auth.dart';
import 'package:task2/services/user_chat_services.dart';

class UsersChat extends StatefulWidget {
  const UsersChat({
    Key? key,
  }) : super(key: key);

  @override
  _UsersChatState createState() => _UsersChatState();
}

class _UsersChatState extends State<UsersChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              logOut(context);
            },
            child: const Text(
              'LogOut',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: UsersChatList(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Delete',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            TextButton(
              onPressed: () {
                Route route = MaterialPageRoute(
                  builder: (context) => const CreateUsers(),
                );
                Navigator.push(context, route);
              },
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsersChatList extends StatelessWidget {
  UsersChatList({Key? key}) : super(key: key);

  final UserChatServices _userChatServices = UserChatServices();

  @override
  Widget build(BuildContext context) {
    return _userChatServices.build(context);
  }
}

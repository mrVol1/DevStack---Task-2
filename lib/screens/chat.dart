import 'package:flutter/material.dart';
import 'package:task2/screens/user_info.dart';
import 'package:task2/services/chat_services.dart';
import 'package:task2/services/user_message_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBartitle(),
        centerTitle: true,
      ),
      body: const ChatBody(),
      bottomNavigationBar: const ChatMessage(),
    );
  }

  Widget _appBartitle() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            Route route = MaterialPageRoute(
              builder: (context) => const UserInfo(),
            );
            Navigator.push(context, route);
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/botfather.png',
            ),
          ),
        ),
        const SizedBox(
          width: 20.0,
        ),
        const Text('User name'),
      ],
    );
  }
}

class ChatBody extends StatefulWidget {
  const ChatBody({
    Key? key,
  }) : super(key: key);

  @override
  _ChatBodyState createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final ChatServices _chatServices = ChatServices();

  @override
  Widget build(BuildContext context) {
    return _chatServices.build(context);
  }
}

class ChatMessage extends StatefulWidget {
  const ChatMessage({Key? key}) : super(key: key);

  @override
  _ChatMessageState createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  final UserMessage _userSendMessage = UserMessage();
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'Message',
                labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Colors.lightBlue,
            ),
            iconSize: 24.0,
            onPressed: () {
              _userSendMessage.sendMessage(context, _messageController.text);
              setState(() {
                _messageController.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}

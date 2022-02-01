import 'package:flutter/material.dart';
import 'package:task2/screens/users_chat.dart';
import 'package:task2/services/create_users_services.dart';

class CreateUsers extends StatefulWidget {
  const CreateUsers({Key? key}) : super(key: key);

  @override
  _CreateUsersState createState() => _CreateUsersState();
}

class _CreateUsersState extends State<CreateUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create User'),
        centerTitle: true,
      ),
      body: const CreateUsersInfo(),
    );
  }
}

class CreateUsersInfo extends StatefulWidget {
  const CreateUsersInfo({Key? key}) : super(key: key);

  @override
  _CreateUsersInfoState createState() => _CreateUsersInfoState();
}

class _CreateUsersInfoState extends State<CreateUsersInfo> {
  final CreatNewUsers _createUsers = CreatNewUsers();

  final _formKey = GlobalKey();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _createUserName(),
          const Divider(),
          _createName(),
          const Divider(),
          _createSurname(),
          const Divider(),
          _createPhone(),
          const SizedBox(
            height: 20.0,
          ),
          _activeButtons(),
        ],
      ),
    );
  }

  Widget _createUserName() {
    return TextFormField(
      controller: userNameController,
      decoration: const InputDecoration(labelText: 'Create nickname'),
    );
  }

  Widget _createName() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(labelText: 'Create name'),
    );
  }

  Widget _createSurname() {
    return TextFormField(
      controller: _surnameController,
      decoration: const InputDecoration(labelText: 'Create surname'),
    );
  }

  Widget _createPhone() {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(labelText: 'Create phone'),
    );
  }

  Widget _activeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            _createUsers.createUsers(
                context,
                userNameController.text,
                _nameController.text,
                _surnameController.text,
                _phoneController.text);
            Route route = MaterialPageRoute(
              builder: (context) => const UsersChat(),
            );
            Navigator.push(context, route);
          },
          child: const Text('Create'),
        ),
        const SizedBox(
          width: 20.0,
        ),
        TextButton(
          onPressed: () {
            _clearControllers();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  void _clearControllers() {
    setState(() {
      userNameController.clear();
      _nameController.clear();
      _surnameController.clear();
      _phoneController.clear();
    });
  }
}

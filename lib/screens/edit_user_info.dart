import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task2/screens/user_info.dart';

class EditUserInfo extends StatefulWidget {
  const EditUserInfo({Key? key}) : super(key: key);

  @override
  _EditUserInfoState createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  final _formKey = GlobalKey();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit user info'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _editUserName(),
            const Divider(),
            _editName(),
            const Divider(),
            _editSurname(),
            const Divider(),
            _editPhone(),
            const SizedBox(
              height: 20.0,
            ),
            _activeButtons(),
          ],
        ),
      ),
    );
  }

  Widget _editUserName() {
    return TextFormField(
      controller: _userNameController,
      decoration: const InputDecoration(labelText: 'Edit nickname'),
    );
  }

  Widget _editName() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(labelText: 'Edit name'),
    );
  }

  Widget _editSurname() {
    return TextFormField(
      controller: _surnameController,
      decoration: const InputDecoration(labelText: 'Edit surname'),
    );
  }

  Widget _editPhone() {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(labelText: 'Edit phone'),
    );
  }

  Widget _activeButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('Task2')
                .doc('main')
                .collection('users')
                .doc()
                .update(
              {
                'User Nickname': _userNameController.text,
                'User Name': _nameController.text,
                'User Surname': _surnameController.text,
                'User Phone': _phoneController.text
              },
            );
            Route route = MaterialPageRoute(
              builder: (context) => const UserInfo(),
            );
            Navigator.push(context, route);
          },
          child: const Text('Save'),
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
      _userNameController.clear();
      _nameController.clear();
      _surnameController.clear();
      _phoneController.clear();
    });
  }
}

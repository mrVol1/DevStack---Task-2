import 'package:flutter/material.dart';
import 'package:task2/screens/login_screen.dart';
import 'package:task2/services/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AurhServices _authServices = AurhServices();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _emailForm(),
            const Divider(),
            _passwordForm(),
            const Divider(),
            _registerButton(),
            const Divider(),
            _registerLink(),
          ],
        ),
      ),
    );
  }

  Widget _emailForm() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Emai',
      ),
      validator: _emailValidator,
    );
  }

  Widget _passwordForm() {
    return TextFormField(
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      validator: _passwordValidator,
    );
  }

  Widget _registerButton() {
    return ElevatedButton(
      onPressed: () {
        _authServices.signUp(
            context, emailController.text, passwordController.text);
      },
      child: const Text('Register'),
    );
  }

  Widget _registerLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Have an account?'),
        const SizedBox(
          width: 20.0,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          },
          child: const Text('Login'),
        ),
      ],
    );
  }

  String? _emailValidator(String? value) {
    if (value!.isEmpty) {
      return ('Please enter your email');
    }
    if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(value)) {
      return ('Plese enter a valid email');
    }
  }

  String? _passwordValidator(String? value) {
    RegExp regex = RegExp(r'^.{8,}$');
    if (value!.isEmpty) {
      return ('Password is required for login');
    }
    if (!regex.hasMatch(value)) {
      return ('Enter Valid Password(Min. 8 Character)');
    }
  }
}

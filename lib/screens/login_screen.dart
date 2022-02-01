import 'package:flutter/material.dart';
import 'package:task2/screens/register_screen.dart';
import 'package:task2/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AurhServices _authServices = AurhServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
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
            _loginButton(),
            const Divider(),
            _registerLink(),
          ],
        ),
      ),
    );
  }

  Widget _emailForm() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Emai',
      ),
      validator: _emailValidator,
    );
  }

  Widget _passwordForm() {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      validator: _passwordValidator,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        _authServices.signIn(
            context, _emailController.text, _passwordController.text);
      },
      child: const Text('Login'),
    );
  }

  Widget _registerLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('No account?'),
        const SizedBox(
          width: 20.0,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ),
                (route) => false);
          },
          child: const Text('Register'),
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

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:minimal_chat/services/auth/auth_services.dart';
import 'package:minimal_chat/widgets/button.dart';
import 'package:minimal_chat/widgets/textfield.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmpasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Passwords doesn't match"),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.message,
                color: Colors.black,
                size: 60,
              ),
              const Text(
                "Let's create an  account",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              MyTextField(
                hintText: 'Enter email',
                obscureText: false,
                controller: _emailController,
              ),
              const SizedBox(height: 15),
              MyTextField(
                hintText: 'Enter password',
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 15),
              MyTextField(
                hintText: 'Confirm password',
                obscureText: true,
                controller: _confirmpasswordController,
              ),
              const SizedBox(height: 15),
              MyButton(
                text: 'Register',
                onTap: () => register(context),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:minimal_chat/services/auth/auth_services.dart';
import 'package:minimal_chat/widgets/button.dart';
import 'package:minimal_chat/widgets/textfield.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  Login({Key? key, required this.onTap}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  void login(BuildContext context) async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("Wrong Credentials"),
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
              const SizedBox(height: 10),
              const Text(
                'Welcome to ChatApp',
                style: TextStyle(fontSize: 17),
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
              const SizedBox(height: 25),
              MyButton(
                text: 'Login',
                onTap: () => {login(context)},
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New User?'),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register',
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

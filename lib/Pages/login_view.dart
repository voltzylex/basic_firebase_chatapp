import 'dart:developer';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    log("New screen");
    return Scaffold(
      body: Column(
        children: [
          Center(
              child: Icon(
            Icons.message,
            size: 80,
            color: Colors.grey[800],
          )),
          // Welcome Text
          const Text("Welcome back you've been missed!"),
        ],
      ),
    );
  }
}

import 'package:firebase_chat_app/Pages/login_view.dart';
import 'package:firebase_chat_app/Pages/register_view.dart';
import 'package:firebase_chat_app/imports.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  togglePages() {
    showLoginPage = !showLoginPage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages,);
    } else {
      return RegisterPage(onTap: togglePages,);
    }
  }
}

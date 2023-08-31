import 'package:firebase_chat_app/Services/auth/auth_services.dart';
import 'package:firebase_chat_app/imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final Function() onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// Text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
// sign in function
  void signIn() async {
    final authService = Provider.of<AuthServices>(context, listen: false);
    try {
      final data = await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      log("Login view catch : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // final TextEditingController nameController = TextEditingController();

    log("Login screen");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey[800],
                )),
                const SizedBox(
                  height: 10,
                ),
                // Welcome Text
                const Text("Welcome back you've been missed!"),
                const SizedBox(
                  height: 10,
                ),
                // name TextField
                // MyTextField(
                //     textEditingController: nameController, hintText: "Name"),
                // const SizedBox(
                //   height: 5,
                // ),
                // Email TextField
                MyTextField(
                    textEditingController: emailController, hintText: "Email"),
                const SizedBox(
                  height: 5,
                ),
                // Password Text Field
                MyTextField(
                  textEditingController: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                // Sign in button
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  text: "Sign in",
                  onTap: () {
                    signIn();
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                //  Not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member? "),
                    TextButton(
                      onPressed: widget.onTap,
                      // () => Navigator.pushNamed(context, "register"),
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                              EdgeInsets.zero),
                          // backgroundColor:
                          //     MaterialStatePropertyAll(Colors.amberAccent),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      child: const Text(
                        "Register Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

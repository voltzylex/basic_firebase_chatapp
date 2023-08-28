import 'package:firebase_chat_app/imports.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log("Register View");
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
                const Text("Lets Create a account for you"),
                const SizedBox(
                  height: 10,
                ),
                // name TextField
                MyTextField(
                    textEditingController: nameController, hintText: "Name"),
                const SizedBox(
                  height: 5,
                ),
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
                  height: 5,
                ),
                MyTextField(
                  textEditingController: passwordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                // Sign in button
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  text: "Sign in",
                  onTap: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                //  Not a member register now
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member? "),
                    Text(
                      "Register Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
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

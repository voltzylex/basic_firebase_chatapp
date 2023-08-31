import 'package:firebase_chat_app/imports.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});
  final Function() onTap;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // Sign Up
  Future signUp() async {
    log("Sign up called");
    final auth = Provider.of<AuthServices>(context, listen: false);
    try {
      final signUp = await auth.signUpWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

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
                  textEditingController: confirmPassword,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                // Sign in button
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                  text: "Sign up",
                  onTap: () {
                    if (passwordController.text != confirmPassword.text) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Password and Confirm Password are not same")));
                      return;
                    } else {
                      signUp();
                      return;
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                //  Not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already a member?"),
                    TextButton(
                      onPressed: widget.onTap,
                      // () {
                      //   Navigator.pop(context);
                      // },
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                              EdgeInsets.zero),
                          // backgroundColor:
                          //     MaterialStatePropertyAll(Colors.amberAccent),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      child: const Text(
                        "Login Now",
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

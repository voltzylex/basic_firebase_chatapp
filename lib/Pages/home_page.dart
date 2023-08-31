
import 'package:firebase_chat_app/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void signOut() {
      final auth = Provider.of<AuthServices>(context, listen: false);
      log("Signout called");
      auth.singOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}

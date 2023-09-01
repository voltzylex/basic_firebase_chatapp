import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/Pages/chat_page.dart';
import 'package:firebase_chat_app/imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Instance of current user
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign out function
  void signOut() {
    final auth = Provider.of<AuthServices>(context, listen: false);
    log("Signout called");
    auth.singOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
        ],
      ),
      body: _buildUserList(),
    );
  }

  // Build For a list of user except, for the current user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error...");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading...");
        }
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItems(doc))
              .toList(),
        );
      },
    );
  }

  // Build Individual User List Items
  Widget _buildUserListItems(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // Display all user Except current user
    if (_auth.currentUser!.email != data["email"]) {
      return ListTile(
        title: Text(data['email']),
        onTap: () {
          // Passed the clicked user UID to chat page
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverUserEmail: data['email'],
              receiverUserId: data["uid"],
            ),
          ));
        },
      );
    } else {
      // Return Empty container || Sizedbox
      return const SizedBox();
    }
  }
}

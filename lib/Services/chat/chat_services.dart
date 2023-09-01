import 'package:firebase_chat_app/imports.dart';

class ChatService extends ChangeNotifier {
  // Instances of firebase
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
// Get current user Info
    final String currentUserId = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
// Get a new user

// Construct chat room id from current user id and receiver id (Sorted to ensure uniqness)

// Add a new message to database
  }

// GET MESSAGES
}

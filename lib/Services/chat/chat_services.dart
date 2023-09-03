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
    MessagesModel newMessage = MessagesModel(
        senderEmail: currentUserEmail,
        message: message,
        receiverId: receiverId,
        senderId: currentUserId,
        timestamp: timestamp);
// Construct chat room id from current user id and receiver id (Sorted to ensure uniqness)
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
// combine the id to a single string to generate chat id
    String chatRoomId = ids.join("_");
// Add a new message to database
    await firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

// GET MESSAGES
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    // Construct chat room id from user ids (sorted to ensure it matches the id when sending the )
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    log("Chat room id $chatRoomId");
    final response = firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();

    return response;
  }
}
// randiom commit 

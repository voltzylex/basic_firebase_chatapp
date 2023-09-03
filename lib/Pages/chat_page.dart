import 'package:firebase_chat_app/Components/chat_bubble.dart';
import 'package:firebase_chat_app/Services/chat/chat_services.dart';
import 'package:firebase_chat_app/imports.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserId});
  final String receiverUserEmail;
  final String receiverUserId;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void sendMessage() async {
    // Send message only if the text is not empty
    if (messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserId, messageController.text);
      messageController.clear();
      // Clear the text controller after message is sent
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          // Input message
          _buildMessageInput(),
        ],
      ),
    );
  }

  // Build message List
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserId, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error.. ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }
        log(snapshot.data!.docs.map((e) => e.toString()).toString());
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  // Build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // Align the message to right if the user is current user othewise left
    var alignment = (data["senderId"] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerLeft
        : Alignment.centerRight;
    log(data["senderEmail"]);
    log("datat is getting");
    return Container(
      // alignment: alignment,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: (data["senderId"] == _firebaseAuth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (data["senderId"] == _firebaseAuth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Text(data["senderEmail"]),
          ChatBubble(message: data["message"]),
        ],
      ),
    );
  }

  // Build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        // TExt field
        Expanded(
          child: TextField(
            controller: messageController,
          ),
        ),
        // Icon button
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.send,
              size: 40,
            )),
      ],
    );
  }
}

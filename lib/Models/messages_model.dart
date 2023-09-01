import 'package:firebase_chat_app/imports.dart';

class MessagesModel {
  final String senderId;
  final String receiverId;
  final String message;
  final String senderEmail;
  final Timestamp timestamp;

  MessagesModel({
    required this.senderEmail,
    required this.message,
    required this.receiverId,
    required this.senderId,
    required this.timestamp,
  });

  // Conver to a map
  Map<String, dynamic> toMap(){
    return {
      "senderId":senderId,
      "receiverId":receiverId,
      "message":message,
      "senderEmail":senderEmail,
      "timestamp":timestamp

    };
  }
}

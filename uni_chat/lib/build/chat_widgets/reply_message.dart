import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_chat/build/chat_widgets/show_image.dart';

class ReplyMessage extends StatelessWidget {
  final String messageReply;
  final bool isMe;
  final bool isDark;
  final String typeMessage;
  final String imageUrl;
  final String chatId;

  const ReplyMessage({
    super.key,
    required this.messageReply,
    required this.isMe,
    required this.isDark,
    required this.typeMessage,
    required this.imageUrl,
    required this.chatId,
  });

  Future<DocumentSnapshot> getReplyMessage() {
    return FirebaseFirestore.instance
        .collection('groups')
        .doc(chatId)
        .collection('messages')
        .doc(messageReply)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getReplyMessage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(strokeWidth: 1),
          );
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return _buildReplyContainer(
            context,
            const Text(
              'Deleted message',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final replyText = data['message'] ?? '';
        final replyType = data['type'] ?? 'text';
        final replyImageUrl = data['imageUrl'] ?? '';

        if (replyType == 'image') {
          return _buildReplyContainer(
            context,
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ShowImage(imageUrl: replyImageUrl),
                  ),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(replyImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        } else {
          return _buildReplyContainer(
            context,
            Text(
              replyText,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildReplyContainer(BuildContext context, Widget child) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe
            ? (isDark ? Colors.blueAccent[200] : Colors.lightBlue[100])

            : (isDark ? Colors.grey[500] : Colors.grey[200]),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(16),
          topRight: const Radius.circular(16),
          bottomRight: Radius.zero,
          bottomLeft: Radius.zero,
        ),
      ),
      child: child,
    );
  }
}

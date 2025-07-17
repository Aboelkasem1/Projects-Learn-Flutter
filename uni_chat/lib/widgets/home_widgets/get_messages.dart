import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetMessages extends StatelessWidget {
  final String chatId;
  final String currentUserName;

  const GetMessages(this.chatId, this.currentUserName, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading messages'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final messages = snapshot.data!.docs;

        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final data = messages[index].data() as Map<String, dynamic>;
            final sender = data['sender'] ?? 'Unknown';
            final message = data['message'] ?? '';

            String time = '';
            if (data['time'] != null && data['time'] is Timestamp) {
              final timestamp = data['time'] as Timestamp;
              time = DateFormat('HH:mm').format(timestamp.toDate());
            }

            final isMe = sender == currentUserName;

            return Align(
              alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isMe
                      ? isDark
                          ? Colors.blue[700]
                          : Colors.blue[300]
                      : isDark? Colors.grey[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: isMe
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(message, style: const TextStyle(fontSize: 16)),
                    if (time.isNotEmpty)
                      Text(time, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

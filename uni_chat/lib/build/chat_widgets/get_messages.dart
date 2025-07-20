import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GetMessages extends StatelessWidget {
  final String chatId;
  final String currentUserId;

  const GetMessages(this.chatId, this.currentUserId, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('groups')
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
            final senderId = data['senderId'] ?? '';
            final message = data['message'] ?? '';

            String time = '';
            if (data['time'] != null && data['time'] is Timestamp) {
              final timestamp = data['time'] as Timestamp;
              time = DateFormat('HH:mm').format(timestamp.toDate());
            }

            final isMe = senderId == currentUserId;

            return Align(
              alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                child: Column(
                  crossAxisAlignment: isMe
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Container(
                      
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isMe
                            ? (isDark ? Colors.blueAccent : Colors.lightBlue[100])
                            : (isDark ? Colors.grey[800] : Colors.grey[300]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: isMe ? Radius.circular(16) : Radius.zero,
                          bottomLeft: isMe ? Radius.zero : Radius.circular(16),
                        ),
                      ),
                      child: Text(message, style: const TextStyle(fontSize: 16)),
                    ),
                    if (time.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Text(
                          time,
                          style: TextStyle(fontSize: 12, ),
                        ),
                      ),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_chat/build/chat_widgets/get_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.group});

  static final String id = 'ChatScreen';
  final Map<String, dynamic> group;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController _controller;
  late CollectionReference messages;
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    messages = FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.group['groupId'])
        .collection('messages');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || user == null) return;

    await messages.add({
      'senderId': user!.uid,
      'senderName': user!.displayName ?? 'Anonymous',
      'message': text,
      'time': FieldValue.serverTimestamp(),
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final groupName = widget.group['name'] ?? 'Group Chat';
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          groupName,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetMessages(widget.group['groupId'], user?.uid ?? ''),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: isDark ? Colors.grey[700] : Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[700] : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: sendMessage,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

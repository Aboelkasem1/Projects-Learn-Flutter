import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_chat/models/chat_model.dart';
import 'package:uni_chat/screens/chat/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String ID = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    final chatList = Provider.of<ChatList>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('UniChat', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {

              chatList.addChat(ChatModel(
                chatId: DateTime.now().millisecondsSinceEpoch.toString(),
                senderId: 'u1',
                senderName: 'Ali',
                receiverId: 'u2',
              ));
            },
          ),
        ],
      ),
      body: chatList.chats.isEmpty
          ? Center(
              child: Text('No chats yet!', style: TextStyle(fontSize: 18)),
            )
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: chatList.chats.length,
              itemBuilder: (context, index) {
                final chat = chatList.chats[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: ListTile(
                    title: Text(chat.senderName),
                    subtitle: Text('Receiver ID: ${chat.receiverId}'),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: Text(chat.senderName[0]),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, ChatScreen.ID, arguments: chat);
                    },
                  ),
                );
              },
            ),
    );
  }
}

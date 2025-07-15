import 'package:flutter/material.dart';
import 'package:uni_chat/models/message_model.dart';

/// Represents a chat between two users.
class ChatModel {
  final String chatId;
  final String senderId;
  final String receiverId;
  final String senderName;

  /// List of messages in this chat
  List<MessageModel> messages;

  ChatModel({
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.senderName,
    List<MessageModel>? messages,
  }) : messages = messages ?? [];

  /// Create ChatModel from JSON
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chatId'] ?? '',
      senderId: json['senderId'] ?? '',
      senderName: json['senderName'] ?? '',
      receiverId: json['receiverId'] ?? '',
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  /// Convert ChatModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'messages': messages.map((msg) => msg.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatModel &&
          chatId == other.chatId &&
          senderId == other.senderId &&
          receiverId == other.receiverId &&
          senderName == other.senderName;

  @override
  int get hashCode =>
      chatId.hashCode ^
      senderId.hashCode ^
      receiverId.hashCode ^
      senderName.hashCode;

  @override
  String toString() {
    return 'ChatModel(chatId: $chatId, sender: $senderName, receiverId: $receiverId)';
  }

  /// Add a message to this chat
  void addMessage(MessageModel message) {
    messages.add(message);
  }
}


/// Provider to manage chat list and notify listeners
class ChatList extends ChangeNotifier {
  final List<ChatModel> _chatList = [
    ChatModel(
      chatId: '1',
      senderId: '1',
      senderName: 'Kasem',
      receiverId: '123',
      messages: [
        MessageModel(
          id: '1',
          senderId: '1',
          text: 'Hello',
          timestamp: DateTime.now(),
        ),
      ],
    ),
  ];

  List<ChatModel> get chats => List.unmodifiable(_chatList);

  void addChat(ChatModel chatModel) {
    _chatList.add(chatModel);
    notifyListeners();
  }

  ChatModel? getChatById(String chatId) {
    return _chatList.firstWhere(
      (chat) => chat.chatId == chatId,
      
    );
  }

  void addMessageToChat(String chatId, MessageModel message) {
    final chat = getChatById(chatId);
    if (chat != null) {
      chat.addMessage(message);
      notifyListeners();
    }
  }

  void removeChat(String chatId) {
    _chatList.removeWhere((chat) => chat.chatId == chatId);
    notifyListeners();
  }

  void clearChats() {
    _chatList.clear();
    notifyListeners();
  }
}

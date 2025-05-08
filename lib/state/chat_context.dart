import 'package:flutter/material.dart';

class ChatContext extends InheritedWidget {
  final String selectedChatId;
  final Function(String) onSelectChat;

  const ChatContext({
    super.key,
    required this.selectedChatId,
    required this.onSelectChat,
    required super.child,
  });

  static ChatContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ChatContext>();
  }

  @override
  bool updateShouldNotify(ChatContext oldWidget) {
    return oldWidget.selectedChatId != selectedChatId;
  }
}

import 'package:flutter/material.dart';
import 'package:realmate_challenge_front/state/chat_context.dart';
import 'package:realmate_challenge_front/widgets/conversation_detail_widget.dart';
import 'package:realmate_challenge_front/widgets/conversations_widget.dart';
import 'package:realmate_challenge_front/widgets/welcome_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatState = ChatContext.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RealmateChat'),
      ),
      body: Row(
        children: [
          const ConversationsWidget(),
          chatState!.selectedChatId == 'none'
              ? const WelcomeWidget()
              : ConversationDetailWidget(
                  conversationId: chatState.selectedChatId,
                ),
        ],
      ),
    );
  }
}


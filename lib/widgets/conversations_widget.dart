import 'package:flutter/material.dart';
import 'package:realmate_challenge_front/models/conversation.dart';
import 'package:realmate_challenge_front/services/conversation_service.dart';
import 'package:realmate_challenge_front/state/chat_context.dart';

class ConversationsWidget extends StatefulWidget {
  const ConversationsWidget({super.key});

  @override
  State<ConversationsWidget> createState() => _ConversationsWidgetState();
}

class _ConversationsWidgetState extends State<ConversationsWidget> {
  final ConversationService service = ConversationService();
  late Future<List<Conversation>> _future;

  @override
  void initState() {
    super.initState();
    _future = _fetchConversations();
  }

  Future<List<Conversation>> _fetchConversations() async {
    return await service.getConversations();
  }

  @override
  Widget build(BuildContext context) {
    ChatContext? chatState = ChatContext.of(context);

    return Container(
      width: MediaQuery.sizeOf(context).width * 0.3,
      height: MediaQuery.sizeOf(context).height,
      color: Colors.grey[200],
      child: FutureBuilder<List<Conversation>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final conversations = snapshot.data!;
            if (conversations.isEmpty) {
              return const Center(child: Text('Nenhuma conversa encontrada.'));
            }
            return ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                final conv = conversations[index];
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey)),
                  child: ListTile(
                    title: Text(conv.status ?? 'Sem título'),
                    subtitle: Text('data: ${conv.startedAt}'),
                    onTap: () {
                      chatState!.onSelectChat(conv.id!);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Sem dados.'));
          }
        },
      ),
    );
  }
}

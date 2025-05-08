import 'package:flutter/material.dart';
import 'package:realmate_challenge_front/models/conversation_detail.dart';
import 'package:realmate_challenge_front/services/conversation_service.dart';

class ConversationDetailWidget extends StatelessWidget {
  const ConversationDetailWidget({super.key, required this.conversationId});
  final String conversationId;

  Future<ConversationDetail> _fetchConversation(String id) async {
    final service = ConversationService();
    return await service.getConversation(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.7,
      color: Colors.blueGrey,
      child: FutureBuilder<ConversationDetail>(
        future: _fetchConversation(conversationId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final conversation = snapshot.data!;
            return ListView.builder(
              itemCount: conversation.messages?.length ?? 0,
              itemBuilder: (context, index) {
                final message = conversation.messages![index];
                final isReceived = message.direction == 'RECEIVED';

                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isReceived ? Colors.brown.shade300 : Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    textColor: Colors.white,
                    title: Text(
                      message.content ?? '',
                      textAlign: isReceived ? TextAlign.start : TextAlign.end,
                    ),
                    subtitle: Text(
                      message.timestamp ?? '',
                      textAlign: isReceived ? TextAlign.start : TextAlign.end,
                      style: const TextStyle(fontSize: 12),
                    ),
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

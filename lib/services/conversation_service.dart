import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realmate_challenge_front/models/conversation.dart';
import 'package:realmate_challenge_front/models/conversation_detail.dart';

class ConversationService {
  String baseUrl = 'http://127.0.0.1:8000/';

  Future<ConversationDetail> getConversation(String id) async {
    var response = await http.get(
      Uri.parse('${baseUrl}conversations/$id'),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return ConversationDetail.fromJson(data as Map<String, dynamic>);
    } else {
      throw Exception(
        'Erro ao carregar conversas: ${response.statusCode}',
      );
    }
  }

  Future<List<Conversation>> getConversations() async {
    var response = await http.get(Uri.parse('${baseUrl}conversations/'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return (data as List)
          .map((json) => Conversation.fromJson(json))
          .toList();
    } else {
      throw Exception(
        'Erro ao carregar conversas: ${response.statusCode}',
      );
    }
  }
}

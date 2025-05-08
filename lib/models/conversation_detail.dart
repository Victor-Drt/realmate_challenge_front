import 'package:realmate_challenge_front/models/message.dart';

class ConversationDetail {
  String? id;
  String? status;
  List<Message>? messages;

  ConversationDetail({this.id, this.status, this.messages});

  ConversationDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    if (json['messages'] != null) {
      messages = <Message>[];
      json['messages'].forEach((v) {
        messages!.add(Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    if (messages != null) {
      data['messages'] = messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


import 'package:intl/intl.dart';

class Message {
  String? id;
  String? conversation;
  String? direction;
  String? content;
  String? timestamp;

  Message({
    this.id,
    this.conversation,
    this.direction,
    this.content,
    this.timestamp,
  });

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conversation = json['conversation'];
    direction = json['direction'];
    content = json['content'];
    timestamp = _toRepresentation(json['timestamp']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['conversation'] = conversation;
    data['direction'] = direction;
    data['content'] = content;
    data['timestamp'] = timestamp;
    return data;
  }
}

String _toRepresentation(String timestamp) {
  String isoTimestamp = timestamp;
  DateTime dateTime = DateTime.parse(isoTimestamp);
  timestamp = DateFormat('HH:mm dd/MM/yyyy').format(dateTime);

  return timestamp;
}

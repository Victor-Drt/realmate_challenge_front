import 'package:intl/intl.dart';


class Conversation {
  String? id;
  String? status;
  String? startedAt;
  String? closedAt;

  Conversation({this.id, this.status, this.startedAt, this.closedAt});

  Conversation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    startedAt = _toRepresentation(json['started_at']);
    closedAt = json['closed_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['started_at'] = startedAt;
    data['closed_at'] = closedAt;
    return data;
  }
}

String _toRepresentation(String timestamp) {
  String isoTimestamp = timestamp;
  DateTime dateTime = DateTime.parse(isoTimestamp);
  timestamp = DateFormat('HH:mm dd/MM/yyyy').format(dateTime);

  return timestamp;
}


import 'package:mychatapp/constant/constant.dart';

class Message {
  final String message;
  String id;
  Message(this.message, this.id);
  factory Message.fromJson(jsonData) {
    return Message(jsonData[Kmessage], jsonData["id"]);
  }
}

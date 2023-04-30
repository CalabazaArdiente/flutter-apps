import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ClassName extends ChangeNotifier {
  List<Message> message = [Message(text: 'Hola!', fromWho: FromWho.their)];

  Future<void> sendMessage() async {}
}

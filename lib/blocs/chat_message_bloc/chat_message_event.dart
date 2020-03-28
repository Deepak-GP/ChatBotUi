
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class ChatMessageEvent extends Equatable
{
  const ChatMessageEvent();

  @override
  List<Object> get props => [];
}

class ChatSubmitted extends ChatMessageEvent
{
  final text;
  final name;
  final type;

  ChatSubmitted({@required this.text, @required this.name, @required this.type});
}

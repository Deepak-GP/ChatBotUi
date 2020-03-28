import 'package:equatable/equatable.dart';

abstract class ChatMessageState extends Equatable
{
  const ChatMessageState();

  @override
  List<Object> get props => [];
}

class EmptyMessageList extends ChatMessageState {}

class FetchingMessage extends ChatMessageState {}

class ChatMessageAdded extends ChatMessageState {}
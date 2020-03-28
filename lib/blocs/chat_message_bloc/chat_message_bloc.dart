

import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_event.dart';
import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_state.dart';
import 'package:chatbot_ui_practice/services/chat_message_service.dart';
import 'package:chatbot_ui_practice/widgets/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessageBloc extends Bloc<ChatMessageEvent, ChatMessageState>
{
  final ChatMessageService chatMessageService;
  ChatMessageBloc({@required this.chatMessageService});

  @override
  ChatMessageState get initialState => EmptyMessageList();

  @override
  Stream<ChatMessageState> mapEventToState(ChatMessageEvent event) async*
  {
    if(event is ChatSubmitted)
    {
      yield* _mapChatSubmitedToChatMessageAdded(event);
    }
  }

  Stream<ChatMessageState> _mapChatSubmitedToChatMessageAdded(ChatSubmitted event) async*
  {
    ChatMessage newChatMessage = ChatMessage(text: event.text, name: event.name, type: event.type);
    await chatMessageService.addChatMessage(newChatMessage);
    yield FetchingMessage();
    ChatMessage queryMessage = ChatMessage(text: 'How can I help you?', name: 'Bot', type: false,);
    await chatMessageService.fetchMessage(queryMessage);
    yield ChatMessageAdded();
  }
  
}
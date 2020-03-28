import 'package:chatbot_ui_practice/widgets/chat_message.dart';

class ChatMessageService
{
  List<ChatMessage> _chatmessages = List<ChatMessage>();

  List<ChatMessage> get getChatmessage => _chatmessages;

  Future addChatMessage(ChatMessage newChatmessage) async
  {
    _chatmessages.insert(0, newChatmessage);
  }

  Future fetchMessage(ChatMessage queryMessage) async
  {
    _chatmessages.insert(0, queryMessage);
  }
}
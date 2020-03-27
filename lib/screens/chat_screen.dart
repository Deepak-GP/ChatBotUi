
import 'package:chatbot_ui_practice/widgets/chat_message.dart';
import 'package:chatbot_ui_practice/widgets/text_area.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  List<ChatMessage> _messages = List<ChatMessage>();

  void response()
  {
    ChatMessage responseMessage = ChatMessage(text: "How can I help you?",name: "Bot",type: false,);
    setState(() {
      _messages.insert(0, responseMessage);
    });
  }

  void onSendPressed(String text)
  {
    ChatMessage message = ChatMessage(text: text, name: "My Message", type: true,);

    setState(() {
      _messages.insert(0, message);
    });

    response();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Flexible(
                  child: ListView.builder(
                    reverse: true,
                    padding: new EdgeInsets.all(8.0),
                    itemCount: _messages.length,
                    itemBuilder: (BuildContext context, int i)
                    {
                      return _messages[i];
                    },
                  ),
                ),
                Divider(),
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: TextArea(onSendPressed: onSendPressed,)
                )
              ],
            ),
      ),
    );
  }
}
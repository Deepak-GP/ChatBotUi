
import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_bloc.dart';
import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_state.dart';
import 'package:chatbot_ui_practice/services/chat_message_service.dart';
import 'package:chatbot_ui_practice/widgets/chat_message.dart';
import 'package:chatbot_ui_practice/widgets/text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  ChatMessageService chatMessageService;
  ChatScreen({@required this.chatMessageService});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Flexible(
                  child: BlocBuilder<ChatMessageBloc, ChatMessageState>(        
                    builder: (BuildContext context, state)
                    {
                      if(state is FetchingMessage)
                      {
                        return CircularProgressIndicator();
                      }
                      else
                      {
                        return ListView.builder(
                          reverse: true,
                          padding: new EdgeInsets.all(8.0),
                          itemCount: widget.chatMessageService.getChatmessage.length,
                          itemBuilder: (BuildContext context, int i)
                          {
                            return widget.chatMessageService.getChatmessage[i];
                          },
                        );
                      }
                    }
                  ),
                ),
                Divider(),
                Container(
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: TextArea()
                )
              ],
            ),
      ),
    );
  }
}
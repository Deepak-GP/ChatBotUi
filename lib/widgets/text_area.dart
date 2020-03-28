

import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_bloc.dart';
import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_event.dart';
import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextArea extends StatelessWidget {
  
  final TextEditingController _textEditingController = TextEditingController();
  BuildContext buildContext;

  void _handleSubmit(String text)
  {
    print('Inside Handle submit');
    _textEditingController.clear();
    BlocProvider.of<ChatMessageBloc>(buildContext).add(ChatSubmitted(text: text, name: "My Message", type: true));
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return BlocBuilder<ChatMessageBloc, ChatMessageState>(
      builder: (context, state)
      {
        return IconTheme(
          data: IconThemeData(color: Theme.of(context).accentColor),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: TextField(
                    controller: _textEditingController,
                    onSubmitted: _handleSubmit,
                    decoration: InputDecoration.collapsed(hintText: "Send a message"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmit(_textEditingController.text),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
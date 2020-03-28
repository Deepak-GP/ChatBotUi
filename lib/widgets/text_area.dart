import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_bloc.dart';
import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_event.dart';
import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_state.dart';
import 'package:chatbot_ui_practice/blocs/text_controller_bloc/text_controller_bloc.dart';
import 'package:chatbot_ui_practice/blocs/text_controller_bloc/text_controller_event.dart';
import 'package:chatbot_ui_practice/blocs/text_controller_bloc/text_controller_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextAreaProvider extends StatelessWidget {
  const TextAreaProvider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TextControllerBloc>(
      create: (context) => TextControllerBloc(),
      child: TextArea(),
    );
  }
}

class TextArea extends StatefulWidget {
  
  @override
  _TextAreaState createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  final TextEditingController _textEditingController = TextEditingController();

  BuildContext buildContext;

  bool get isTextControllerPopulated => _textEditingController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onTextChanged);
  }

  bool isSendButtonEnabled(TextControllerState state)
  {
    print('$isTextControllerPopulated');
    return isTextControllerPopulated && state.isFilled;
  }

  void _onTextChanged()
  {
      BlocProvider.of<TextControllerBloc>(context).add(TextChanged());
  }

  void _handleSubmit(String text)
  {
    _textEditingController.clear();
    BlocProvider.of<ChatMessageBloc>(buildContext).add(ChatSubmitted(text: text, name: "My Message", type: true));
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return BlocBuilder<TextControllerBloc, TextControllerState>(
      builder: (context, state){
        print('Inside builder');
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
                    color: isSendButtonEnabled(state) ? Colors.blue : Colors.grey,
                    onPressed: () => isSendButtonEnabled(state)?  _handleSubmit(_textEditingController.text) : null,
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
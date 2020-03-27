

import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  
  final TextEditingController _textEditingController = TextEditingController();
  Function onSendPressed;
  TextArea({@required this.onSendPressed});

  void _handleSubmit(String text)
  {
    _textEditingController.clear();
    onSendPressed(text);
  }

  @override
  Widget build(BuildContext context) {
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
  }
}

import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final String name;
  final bool type;

  ChatMessage({@required this.text, @required this.name, @required this.type});

  List<Widget> otherMessage(BuildContext context)
  {
    return <Widget>[
      Container(
        margin: EdgeInsets.only(right: 15.0),
        child: CircleAvatar(
          child: Text(
            this.name[0],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.name, style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Text(this.text),
            )
          ],
        ),
      )
    ];
  }

  List<Widget> myMessage(BuildContext context)
  {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(this.name, style: Theme.of(context).textTheme.subtitle1,),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Text(this.text),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 15.0),
        child: CircleAvatar(
          child: Text(
            this.name[0],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
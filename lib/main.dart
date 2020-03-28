import 'package:chatbot_ui_practice/blocs/chat_message_bloc/chat_message_bloc.dart';
import 'package:chatbot_ui_practice/screens/chat_screen.dart';
import 'package:chatbot_ui_practice/services/chat_message_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ChatMessageService chatMessageService = ChatMessageService();
  runApp(MyApp(chatMessageService: chatMessageService,));
}

class MyApp extends StatelessWidget {

  final ChatMessageService chatMessageService;
  MyApp({@required this. chatMessageService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatBot UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ChatMessageBloc(chatMessageService: chatMessageService),
        child: ChatScreen(chatMessageService: chatMessageService,)
      ),
    );
  }
}


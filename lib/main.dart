import 'package:chatbot_ui_practice/blocs/simple_bloc_delegate.dart';
import 'package:chatbot_ui_practice/blocs/spash_screen_bloc/spash_screen_state.dart';
import 'package:chatbot_ui_practice/blocs/spash_screen_bloc/splash_screen_bloc.dart';
import 'package:chatbot_ui_practice/blocs/spash_screen_bloc/splash_screen_event.dart';
import 'package:chatbot_ui_practice/screens/chat_screen.dart';
import 'package:chatbot_ui_practice/screens/splash_screen.dart';
import 'package:chatbot_ui_practice/services/chat_message_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  ChatMessageService chatMessageService = ChatMessageService();
  runApp(
    BlocProvider(
      create: (context) => SplashScreenBloc()..add(LoadSplashScreen()),
      child: MyApp(chatMessageService: chatMessageService,)
    )
  );
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
      home: BlocBuilder<SplashScreenBloc,SplashScreenState>(

        builder: (context , state)
        {
          if(state is Loading)
          {
            return SplashScreen();
          }
          if(state is Loaded)
          {
            return ChatScreen(chatMessageService: chatMessageService);
          }
        }
      )
    );
  }
}


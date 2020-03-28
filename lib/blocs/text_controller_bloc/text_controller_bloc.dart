

import 'package:chatbot_ui_practice/blocs/text_controller_bloc/text_controller_event.dart';
import 'package:chatbot_ui_practice/blocs/text_controller_bloc/text_controller_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextControllerBloc extends Bloc<TextControllerEvent, TextControllerState>
{
  @override
  TextControllerState get initialState => EmptyTextController(false);

  @override
  Stream<TextControllerState> mapEventToState(TextControllerEvent event) async*
  {
    if(event is TextChanged)
    {
      yield* _mapTextChangedToFilledTextController();
    }
  }

  Stream<TextControllerState> _mapTextChangedToFilledTextController() async*
  {
    yield EmptyTextController(false);
    yield FilledTextController(true);
  }
  
}
import 'package:chatbot_ui_practice/blocs/spash_screen_bloc/spash_screen_state.dart';
import 'package:chatbot_ui_practice/blocs/spash_screen_bloc/splash_screen_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState>
{
  @override
  SplashScreenState get initialState => Loading();

  @override
  Stream<SplashScreenState> mapEventToState(SplashScreenEvent event) async*
  {
    if(event is LoadSplashScreen)
    {
      yield* _mapLoadToLLoading();
    }
  }

  Stream<SplashScreenState> _mapLoadToLLoading() async*
  {
    yield Loading();
    await Future.delayed(Duration(seconds: 5));
    yield Loaded();
  }
}
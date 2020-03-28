

import 'package:equatable/equatable.dart';

abstract class SplashScreenState extends Equatable
{
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

class Loading extends SplashScreenState{}

class Loaded extends SplashScreenState{}


import 'package:equatable/equatable.dart';

abstract class TextControllerEvent extends Equatable
{
  const TextControllerEvent();

  @override
  List<Object> get props => [];
}

class TextChanged extends TextControllerEvent{}
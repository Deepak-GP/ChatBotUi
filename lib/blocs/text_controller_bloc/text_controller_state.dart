

import 'package:equatable/equatable.dart';

abstract class TextControllerState extends Equatable
{
  const TextControllerState(this.isFilled);
  final bool isFilled;

  @override
  List<Object> get props => [];
}

class EmptyTextController extends TextControllerState {
  EmptyTextController(bool isFilled) : super(isFilled);
}

class FilledTextController extends TextControllerState {
  FilledTextController(bool isFilled) : super(isFilled);
}
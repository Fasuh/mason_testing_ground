import 'package:equatable/equatable.dart';
import 'package:{{project_name}}/core/error/failures.dart';

abstract class AnyAnimatedButtonState extends Equatable {
  @override
  List<Object> get props => [];
}

class DefaultAnyAnimatedButtonState extends AnyAnimatedButtonState {
  @override
  List<Object> get props => [];
}

class ProgressAnyAnimatedButtonState extends AnyAnimatedButtonState {
  @override
  List<Object> get props => [];
}

class ErrorAnyAnimatedButtonState extends AnyAnimatedButtonState {
  final Failure failure;

  ErrorAnyAnimatedButtonState(this.failure);

  @override
  List<Object> get props => [failure];
}

class SuccessAnyAnimatedButtonState<G extends Object> extends AnyAnimatedButtonState {
  final G object;

  SuccessAnyAnimatedButtonState(this.object);

  @override
  List<Object> get props => [object];
}

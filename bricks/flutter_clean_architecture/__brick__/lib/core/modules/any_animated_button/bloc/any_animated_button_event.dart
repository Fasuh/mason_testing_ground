import 'package:equatable/equatable.dart';

abstract class AnyAnimatedButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TriggerAnyAnimatedButtonEvent<T extends Object> extends AnyAnimatedButtonEvent {
  TriggerAnyAnimatedButtonEvent({this.object});

  final T? object;

  @override
  List<Object?> get props => [object];
}

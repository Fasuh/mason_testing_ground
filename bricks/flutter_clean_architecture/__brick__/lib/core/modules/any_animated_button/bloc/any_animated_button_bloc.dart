import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:{{project_name}}/core/error/failures.dart';
import 'package:{{project_name}}/core/modules/any_animated_button/bloc/any_animated_button_event.dart';
import 'package:{{project_name}}/core/modules/any_animated_button/bloc/any_animated_button_state.dart';

abstract class AnyAnimatedButtonBloc<T extends Object, G extends Object>
    extends Bloc<AnyAnimatedButtonEvent, AnyAnimatedButtonState> {
  AnyAnimatedButtonBloc() : super(DefaultAnyAnimatedButtonState());

  @override
  Stream<AnyAnimatedButtonState> mapEventToState(AnyAnimatedButtonEvent event) async* {
    if (event is TriggerAnyAnimatedButtonEvent<T>) {
      yield* _trigger(event);
    } else {
      throw Exception('wrong invocation of AnyAnimatedBloc');
    }
  }

  Stream<AnyAnimatedButtonState> _trigger(TriggerAnyAnimatedButtonEvent<T> event) async* {
    yield ProgressAnyAnimatedButtonState();
    final Either<Failure, G> result = await asyncAction(event);
    yield* result.fold(
      (Failure failure) async* {
        yield ErrorAnyAnimatedButtonState(failure);
      },
      (G data) async* {
        yield SuccessAnyAnimatedButtonState<G>(data);
      },
    );
    await Future.delayed(const Duration(milliseconds: 500));
    yield DefaultAnyAnimatedButtonState();
  }

  Future<Either<Failure, G>> asyncAction(TriggerAnyAnimatedButtonEvent<T> event);
}

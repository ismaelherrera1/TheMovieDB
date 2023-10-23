import 'enum_states.dart';

abstract class DataState<T> {
  final BaseState state;
  final T? data;
  final String? error;

  DataState({
    required this.state,
    this.data,
    this.error,
  });
}

class SuccessState<T> extends DataState<T> {
  SuccessState(T data)
      : super(
          state: BaseState.success,
          data: data,
        );
}

class FailState<T> extends DataState<T> {
  FailState(String error)
      : super(
          state: BaseState.failure,
          error: error,
        );
}

class LoadingState<T> extends DataState<T> {
  LoadingState(BaseState state)
      : super(
          state: BaseState.loading,
        );
}

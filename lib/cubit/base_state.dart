sealed class BaseState {
  const BaseState();
}

class LoadingState extends BaseState {
  const LoadingState();
}

class ErrorState extends BaseState {
  final Object error;

  const ErrorState(this.error);
}

class ResultState<T> extends BaseState {
  final T value;

  const ResultState(this.value);
}

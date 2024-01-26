import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:test_job_15_01_24/cubit/base_state.dart';

abstract class BaseCubit<T> extends Cubit<BaseState> {
  BaseCubit() : super(const LoadingState()) {
    loadData();
  }

  Future<void> loadData() async {
    if (state is! LoadingState) emit( const LoadingState());
    try {
      emit(ResultState<T>(await fetchData()));
    } catch (e) {
      emit(ErrorState(e));
    }
  }

  @protected
  Future<T> fetchData();
}

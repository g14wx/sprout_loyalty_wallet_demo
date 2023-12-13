import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'fetch_store_event.dart';
part 'fetch_store_state.dart';

part 'fetch_store_bloc.freezed.dart';

@injectable
class FetchStoreBloc extends Bloc<FetchStoreEvent, FetchStoreState> {
  FetchStoreBloc() : super(const FetchStoreState.initialState()) {
    on<FetchStoreEvent>((event, emit) async {
      await event.map(
        tryToFetchStoreInformation: (value) async {
          emit(const FetchStoreState.loading());
          await Future.delayed(const Duration(seconds: 3));
          emit(const FetchStoreState.success());
        },
      );
    });
  }
}

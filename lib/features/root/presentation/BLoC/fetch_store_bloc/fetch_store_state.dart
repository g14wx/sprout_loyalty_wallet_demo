part of 'fetch_store_bloc.dart';

@freezed
class FetchStoreState with _$FetchStoreState {
  const factory FetchStoreState.initialState() = _InitialState;
  const factory FetchStoreState.loading() = _Loading;
  const factory FetchStoreState.success() = _Success;
}

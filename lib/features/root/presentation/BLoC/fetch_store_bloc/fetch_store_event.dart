part of 'fetch_store_bloc.dart';
@freezed
class FetchStoreEvent with _$FetchStoreEvent {
  const factory FetchStoreEvent.tryToFetchStoreInformation() = _TryToFetchStoreInformation;
}

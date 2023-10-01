import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_state.freezed.dart';

// @Freezed(maybeMap: false, maybeWhen: false)
@Freezed(
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false, map: false), when: FreezedWhenOptions(maybeWhen: false))
abstract class RequestState<T> with _$RequestState<T> {
  const factory RequestState.idle() = RequestIdle<T>;
  const factory RequestState.loading() = RequestLoading<T>;
  const factory RequestState.data(T? data) = RequestData<T>;
  const factory RequestState.error(
    Object? errorText,
    StackTrace? stackTrace,
  ) = RequestError<T>;
}

extension RequestStateX<T> on RequestState<T> {
  bool get isInitial => this == RequestIdle<T>();
  bool get isLoading => this == RequestLoading<T>();
  void Function()? onTapDisable(void Function()? callback) => isLoading
      ? null
      : () {
          callback?.call();
        };
  T? get value => when(
        idle: () => null,
        loading: () => null,
        data: (data) => data,
        error: (errorText, stackTrace) => null,
      );

  Object? get error => when(
        idle: () => null,
        loading: () => null,
        data: (data) => null,
        error: (error, stackTrace) => error,
      );

  bool get listNullOrEmpty => when(
        idle: () => true,
        loading: () => true,
        data: (data) => data == null || (data is List && data.isEmpty),
        error: (error, stackTrace) => true,
      );

  // bool get isSuccess => this == RequestState.data;
  // bool get isError => this == RequestState.error;
}

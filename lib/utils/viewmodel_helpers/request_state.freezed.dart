// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) data,
    required TResult Function(Object? errorText, StackTrace? stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? data)? data,
    TResult? Function(Object? errorText, StackTrace? stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<T, $Res> {
  factory $RequestStateCopyWith(
          RequestState<T> value, $Res Function(RequestState<T>) then) =
      _$RequestStateCopyWithImpl<T, $Res, RequestState<T>>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<T, $Res, $Val extends RequestState<T>>
    implements $RequestStateCopyWith<T, $Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RequestIdleImplCopyWith<T, $Res> {
  factory _$$RequestIdleImplCopyWith(_$RequestIdleImpl<T> value,
          $Res Function(_$RequestIdleImpl<T>) then) =
      __$$RequestIdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RequestIdleImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestIdleImpl<T>>
    implements _$$RequestIdleImplCopyWith<T, $Res> {
  __$$RequestIdleImplCopyWithImpl(
      _$RequestIdleImpl<T> _value, $Res Function(_$RequestIdleImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestIdleImpl<T> implements RequestIdle<T> {
  const _$RequestIdleImpl();

  @override
  String toString() {
    return 'RequestState<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestIdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) data,
    required TResult Function(Object? errorText, StackTrace? stackTrace) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? data)? data,
    TResult? Function(Object? errorText, StackTrace? stackTrace)? error,
  }) {
    return idle?.call();
  }
}

abstract class RequestIdle<T> implements RequestState<T> {
  const factory RequestIdle() = _$RequestIdleImpl<T>;
}

/// @nodoc
abstract class _$$RequestLoadingImplCopyWith<T, $Res> {
  factory _$$RequestLoadingImplCopyWith(_$RequestLoadingImpl<T> value,
          $Res Function(_$RequestLoadingImpl<T>) then) =
      __$$RequestLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RequestLoadingImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestLoadingImpl<T>>
    implements _$$RequestLoadingImplCopyWith<T, $Res> {
  __$$RequestLoadingImplCopyWithImpl(_$RequestLoadingImpl<T> _value,
      $Res Function(_$RequestLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestLoadingImpl<T> implements RequestLoading<T> {
  const _$RequestLoadingImpl();

  @override
  String toString() {
    return 'RequestState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) data,
    required TResult Function(Object? errorText, StackTrace? stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? data)? data,
    TResult? Function(Object? errorText, StackTrace? stackTrace)? error,
  }) {
    return loading?.call();
  }
}

abstract class RequestLoading<T> implements RequestState<T> {
  const factory RequestLoading() = _$RequestLoadingImpl<T>;
}

/// @nodoc
abstract class _$$RequestDataImplCopyWith<T, $Res> {
  factory _$$RequestDataImplCopyWith(_$RequestDataImpl<T> value,
          $Res Function(_$RequestDataImpl<T>) then) =
      __$$RequestDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$RequestDataImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestDataImpl<T>>
    implements _$$RequestDataImplCopyWith<T, $Res> {
  __$$RequestDataImplCopyWithImpl(
      _$RequestDataImpl<T> _value, $Res Function(_$RequestDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RequestDataImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$RequestDataImpl<T> implements RequestData<T> {
  const _$RequestDataImpl(this.data);

  @override
  final T? data;

  @override
  String toString() {
    return 'RequestState<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestDataImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestDataImplCopyWith<T, _$RequestDataImpl<T>> get copyWith =>
      __$$RequestDataImplCopyWithImpl<T, _$RequestDataImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) data,
    required TResult Function(Object? errorText, StackTrace? stackTrace) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? data)? data,
    TResult? Function(Object? errorText, StackTrace? stackTrace)? error,
  }) {
    return data?.call(this.data);
  }
}

abstract class RequestData<T> implements RequestState<T> {
  const factory RequestData(final T? data) = _$RequestDataImpl<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$RequestDataImplCopyWith<T, _$RequestDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestErrorImplCopyWith<T, $Res> {
  factory _$$RequestErrorImplCopyWith(_$RequestErrorImpl<T> value,
          $Res Function(_$RequestErrorImpl<T>) then) =
      __$$RequestErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object? errorText, StackTrace? stackTrace});
}

/// @nodoc
class __$$RequestErrorImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestErrorImpl<T>>
    implements _$$RequestErrorImplCopyWith<T, $Res> {
  __$$RequestErrorImplCopyWithImpl(
      _$RequestErrorImpl<T> _value, $Res Function(_$RequestErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$RequestErrorImpl<T>(
      freezed == errorText ? _value.errorText : errorText,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$RequestErrorImpl<T> implements RequestError<T> {
  const _$RequestErrorImpl(this.errorText, this.stackTrace);

  @override
  final Object? errorText;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'RequestState<$T>.error(errorText: $errorText, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestErrorImpl<T> &&
            const DeepCollectionEquality().equals(other.errorText, errorText) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorText), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestErrorImplCopyWith<T, _$RequestErrorImpl<T>> get copyWith =>
      __$$RequestErrorImplCopyWithImpl<T, _$RequestErrorImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function(T? data) data,
    required TResult Function(Object? errorText, StackTrace? stackTrace) error,
  }) {
    return error(errorText, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function(T? data)? data,
    TResult? Function(Object? errorText, StackTrace? stackTrace)? error,
  }) {
    return error?.call(errorText, stackTrace);
  }
}

abstract class RequestError<T> implements RequestState<T> {
  const factory RequestError(
          final Object? errorText, final StackTrace? stackTrace) =
      _$RequestErrorImpl<T>;

  Object? get errorText;
  StackTrace? get stackTrace;
  @JsonKey(ignore: true)
  _$$RequestErrorImplCopyWith<T, _$RequestErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

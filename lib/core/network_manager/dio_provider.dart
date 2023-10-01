import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.interceptors.addAll(
    [
      if (kDebugMode) PrettyDioLogger(requestBody: true, responseBody: true, error: true, compact: true, maxWidth: 90),
    ],
  );
  return dio;
}

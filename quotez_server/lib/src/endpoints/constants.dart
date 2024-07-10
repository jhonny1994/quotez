import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.quotable.io',
  ),
)..interceptors.add(
    PrettyDioLogger(
      responseBody: false,
      requestHeader: true,
      responseHeader: true,
    ),
  );

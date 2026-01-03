import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final flightDioProvider = Provider<Dio>((ref) {
  return createDio(baseUrl: dotenv.env['FLIGHT_BASE_URL']!);
});

final airportDioProvider = Provider<Dio>((ref) {
  return createDio(baseUrl: dotenv.env['AIRPORT_BASE_URL']!);
});

Dio createDio({required String baseUrl}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          final idToken = await user.getIdToken();
          options.headers['Authorization'] = 'Bearer $idToken';
        }

        handler.next(options);
      },
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}

import 'package:dio/dio.dart';
import '../core/error_handler.dart';

class ApiService {
  final Dio _dio;

  ApiService() : _dio = Dio(BaseOptions(
    baseUrl: 'https://api.furnitureapp.com/v1', // Placeholder
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      // For now, we simulate a successful response for mock repositories
      // but the structure is ready for real API integration.
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw AppError(_handleDioError(e));
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.badResponse:
        return 'Server error: ${error.response?.statusCode}';
      default:
        return 'Something went wrong. Please check your internet connection.';
    }
  }
}

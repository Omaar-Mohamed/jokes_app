import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/home/model/Joke.dart';
import 'ApiException.dart';

class JokeService {
  late final Dio _dio;

  JokeService() {
    _dio = Dio();
    // Add pretty dio logger to log all network calls to console
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<Joke> fetchJoke(
      {required String category, required String blacklistFlags, required String type, required String contains}
      ) async {
    try {
      final url = Uri.https(
        'v2.jokeapi.dev',
        '/joke/$category',
        {
          'blacklistFlags': blacklistFlags,
          'type': type,
          if (contains.isNotEmpty) 'contains': contains,
        },
      );
      final response = await _dio.getUri(url);
      final joke = Joke.fromJson(response.data);

      // Check if the API returned an error
      if (joke.error == true) {
        throw ApiException(joke.message ?? 'An error occurred while fetching the joke');
      }

      return joke;
    } on DioException catch (e) {
      // Handle Dio errors (like 400, 404, 500, etc.)
      if (e.response != null && e.response?.data != null) {
        // Try to parse the error response
        final errorData = e.response!.data;
        if (errorData is Map<String, dynamic>) {
          final joke = Joke.fromJson(errorData);
          throw ApiException(joke.message ?? 'An error occurred while fetching the joke');
        }
      }
      // If no response data, throw a generic network error
      throw ApiException('Network error occurred');
    } catch (e) {
      // If it's already our ApiException with the message, rethrow it
      if (e is ApiException) {
        rethrow;
      }
      // Handle any other unexpected errors
      throw ApiException('An unexpected error occurred');
    }
  }
}

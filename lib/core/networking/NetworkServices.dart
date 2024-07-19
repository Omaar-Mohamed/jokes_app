import 'package:dio/dio.dart';

import '../../features/home/model/Joke.dart';

class JokeService {
  final Dio _dio = Dio();

  Future<Joke> fetchJoke() async {
    final response = await _dio.get('https://v2.jokeapi.dev/joke/Programming?blacklistFlags=religious');
    return Joke.fromJson(response.data);
  }
}



import '../../../core/networking/NetworkServices.dart';
import '../model/Joke.dart';

class HomeRepo {
  final JokeService _service = JokeService();

  Future<Joke> getJoke() {
    return _service.fetchJoke();
  }
}

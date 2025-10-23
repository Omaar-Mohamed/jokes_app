import '../../../core/networking/NetworkServices.dart';
import '../model/Joke.dart';

class HomeRepo {
  final JokeService _service = JokeService();

  Future<Joke> getJoke(
      {
        required String category,
        required String type,
        required String blacklistFlags,
        required String contains,
      }
      ) {
    return _service.fetchJoke(
      category: category,
      type: type,
      blacklistFlags: blacklistFlags,
      contains: contains
    );
  }
}

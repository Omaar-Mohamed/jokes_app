import '../model/Joke.dart';

abstract class JokeState {}

class JokeLoading extends JokeState {}

class JokeError extends JokeState {
  final String message;

  JokeError(this.message);
}

class JokeSuccess extends JokeState {
  final Joke joke;

  JokeSuccess(this.joke);
}

class JokeInitial extends JokeState {}

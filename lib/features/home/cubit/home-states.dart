import '../model/Joke.dart';

abstract class JokeState {
  final String selectedCategory;
  final String selectedBlacklistFlag;
  final String selectedType;
  final String searchText;

  JokeState({
    this.selectedCategory = 'Programming',
    this.selectedBlacklistFlag = 'nsfw',
    this.selectedType = 'single',
    this.searchText = '',
  });
}

class JokeLoading extends JokeState {
  JokeLoading({
    required String selectedCategory,
    required String selectedBlacklistFlag,
    required String selectedType,
    required String searchText,
  }) : super(
          selectedCategory: selectedCategory,
          selectedBlacklistFlag: selectedBlacklistFlag,
          selectedType: selectedType,
          searchText: searchText,
        );
}

class JokeError extends JokeState {
  final String message;

  JokeError(
    this.message, {
    required String selectedCategory,
    required String selectedBlacklistFlag,
    required String selectedType,
    required String searchText,
  }) : super(
          selectedCategory: selectedCategory,
          selectedBlacklistFlag: selectedBlacklistFlag,
          selectedType: selectedType,
          searchText: searchText,
        );
}

class JokeSuccess extends JokeState {
  final Joke joke;

  JokeSuccess(
    this.joke, {
    required String selectedCategory,
    required String selectedBlacklistFlag,
    required String selectedType,
    required String searchText,
  }) : super(
          selectedCategory: selectedCategory,
          selectedBlacklistFlag: selectedBlacklistFlag,
          selectedType: selectedType,
          searchText: searchText,
        );
}

class JokeInitial extends JokeState {
  JokeInitial({
    String selectedCategory = 'Programming',
    String selectedBlacklistFlag = 'nsfw',
    String selectedType = 'single',
    String searchText = '',
  }) : super(
          selectedCategory: selectedCategory,
          selectedBlacklistFlag: selectedBlacklistFlag,
          selectedType: selectedType,
          searchText: searchText,
        );
}

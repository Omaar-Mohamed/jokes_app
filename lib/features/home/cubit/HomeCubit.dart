import 'package:bloc/bloc.dart';
import 'package:jokes_app/features/home/repo/home-repo.dart';

import 'home-states.dart';


class HomeCubit extends Cubit<JokeState> {
  final HomeRepo _repository = HomeRepo();

  HomeCubit() : super(JokeInitial());

  // Update category dropdown
  void updateCategory(String category) {
    emit(_copyStateWith(selectedCategory: category));
  }

  // Update blacklist flag dropdown
  void updateBlacklistFlag(String flag) {
    emit(_copyStateWith(selectedBlacklistFlag: flag));
  }

  // Update type dropdown
  void updateType(String type) {
    emit(_copyStateWith(selectedType: type));
  }

  // Update search text
  void updateSearchText(String text) {
    emit(_copyStateWith(searchText: text));
  }

  // Helper method to copy state with updated values
  JokeState _copyStateWith({
    String? selectedCategory,
    String? selectedBlacklistFlag,
    String? selectedType,
    String? searchText,
  }) {
    final currentState = state;

    if (currentState is JokeSuccess) {
      return JokeSuccess(
        currentState.joke,
        selectedCategory: selectedCategory ?? currentState.selectedCategory,
        selectedBlacklistFlag: selectedBlacklistFlag ?? currentState.selectedBlacklistFlag,
        selectedType: selectedType ?? currentState.selectedType,
        searchText: searchText ?? currentState.searchText,
      );
    } else if (currentState is JokeError) {
      // Clear error but preserve all state values including the new ones
      return JokeInitial(
        selectedCategory: selectedCategory ?? currentState.selectedCategory,
        selectedBlacklistFlag: selectedBlacklistFlag ?? currentState.selectedBlacklistFlag,
        selectedType: selectedType ?? currentState.selectedType,
        searchText: searchText ?? currentState.searchText,
      );
    } else if (currentState is JokeLoading) {
      // Preserve state during loading
      return JokeLoading(
        selectedCategory: selectedCategory ?? currentState.selectedCategory,
        selectedBlacklistFlag: selectedBlacklistFlag ?? currentState.selectedBlacklistFlag,
        selectedType: selectedType ?? currentState.selectedType,
        searchText: searchText ?? currentState.searchText,
      );
    } else {
      // JokeInitial or any other state
      return JokeInitial(
        selectedCategory: selectedCategory ?? currentState.selectedCategory,
        selectedBlacklistFlag: selectedBlacklistFlag ?? currentState.selectedBlacklistFlag,
        selectedType: selectedType ?? currentState.selectedType,
        searchText: searchText ?? currentState.searchText,
      );
    }
  }

  void fetchJoke() async {
    emit(JokeLoading(
      selectedCategory: state.selectedCategory,
      selectedBlacklistFlag: state.selectedBlacklistFlag,
      selectedType: state.selectedType,
      searchText: state.searchText,
    ));

    try {
      final joke = await _repository.getJoke(
        category: state.selectedCategory,
        type: state.selectedType,
        blacklistFlags: state.selectedBlacklistFlag,
        contains: state.searchText,
      );

      emit(JokeSuccess(
        joke,
        selectedCategory: state.selectedCategory,
        selectedBlacklistFlag: state.selectedBlacklistFlag,
        selectedType: state.selectedType,
        searchText: state.searchText,
      ));
    } catch (e) {
      // The error message is now clean - no need to remove prefix
      emit(JokeError(
        e.toString(),
        selectedCategory: state.selectedCategory,
        selectedBlacklistFlag: state.selectedBlacklistFlag,
        selectedType: state.selectedType,
        searchText: state.searchText,
      ));
      print('Error fetching joke: ${e.toString()}');
    }
  }
}

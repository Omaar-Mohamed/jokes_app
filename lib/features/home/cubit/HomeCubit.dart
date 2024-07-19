import 'package:bloc/bloc.dart';
import 'package:jokes_app/features/home/repo/home-repo.dart';

import 'home-states.dart';


class HomeCubit extends Cubit<JokeState> {
  final HomeRepo _repository = HomeRepo();

  HomeCubit() : super(JokeInitial());

  void fetchJoke() async {
    emit(JokeLoading());
    try {
      final joke = await _repository.getJoke();
      emit(JokeSuccess(joke));
    } catch (e) {
      emit(JokeError(e.toString()));
      print(e.toString());
    }
  }
}

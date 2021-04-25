import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.EMPTY);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  final homeRepository = HomeRepository();

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.LOADING;
    //await Future.delayed(Duration(seconds: 2));

    user = await homeRepository.getUser();

    state = HomeState.SUCCESS;
  }

  void getQuizzes() async {
    state = HomeState.LOADING;
    //await Future.delayed(Duration(seconds: 2));
    quizzes = await homeRepository.getQuizzes();
    state = HomeState.SUCCESS;
  }
}

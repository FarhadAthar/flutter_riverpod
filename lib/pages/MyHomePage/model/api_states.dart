import 'package:flutter_riverpod_application/apis/joke_model.dart';

abstract class ApiDataStates {}

class ApiDataInitialState extends ApiDataStates{
}

class ApiDataLoadingState extends ApiDataStates {}

class ApiDataLoadedState extends ApiDataStates {
  final JokeModel jokeModel;
  ApiDataLoadedState({required this.jokeModel});
}

class ApiDataErrorState extends ApiDataStates{
  final String error;
  ApiDataErrorState({required this.error});
}

import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_application/apis/api_service.dart';
import 'package:flutter_riverpod_application/pages/MyHomePage/model/api_states.dart';

class ApiStateNotifier extends Notifier<ApiDataStates> {
  final JokeApiService _jokeApiService = JokeApiService();

  @override
  ApiDataStates build() {
    return ApiDataInitialState();
  }

  void loadData() async {
    state = ApiDataLoadingState();
    try {
      var joke = await _jokeApiService.fetchJoke();
      state = ApiDataLoadedState(jokeModel: joke);
    } catch (e) {
      log('Error while loading data in ApiStateNotifier : ${e.toString()}');
      state = ApiDataErrorState(error: e.toString());
    }
  }
}

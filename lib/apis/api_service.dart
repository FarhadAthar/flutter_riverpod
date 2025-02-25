import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'joke_model.dart';

abstract class ApiService {
  String get baseUrl => "https://v2.jokeapi.dev/joke/";
  fetch({String endpoint = ""}) async {
    String apiUrl = baseUrl + endpoint;
    var response = await get(Uri.parse(apiUrl));
    log("Response : ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      log("Response not found");
    }
  }
}

class JokeApiService extends ApiService {
  String endPoint = "programming?type=single";
  Future<JokeModel> fetchJoke() async {
    var map = await fetch(endpoint: endPoint);
    return JokeModel.fromMap(map);
  }
}

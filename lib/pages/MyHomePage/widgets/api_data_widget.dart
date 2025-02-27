import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_application/pages/MyHomePage/controller/api_controller.dart';
import 'package:flutter_riverpod_application/pages/MyHomePage/model/api_states.dart';

class ApiDataWidget extends ConsumerWidget {
  const ApiDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(apiDataStateProvider);
    return Builder(
      builder: (context) {
        if (state is ApiDataInitialState) {
          return const Text("Click to fetch data");
        } else if (state is ApiDataLoadingState) {
          return const CircularProgressIndicator();
        } else if (state is ApiDataLoadedState) {
          return Column(
            children: [
              Text(state.jokeModel.category),
              Text(state.jokeModel.joke),
              Text(state.jokeModel.type),
            ],
          );
        } else {
          return const Text("Error while fetching the data!");
        }
      },
    );
  }
}

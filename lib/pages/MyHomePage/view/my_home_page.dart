import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_application/pages/MyHomePage/controller/api_controller.dart';
import 'package:flutter_riverpod_application/pages/MyHomePage/widgets/api_data_widget.dart';
import 'package:flutter_riverpod_application/pages/MyHomePage/widgets/text_widgets.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HardCodedText(),
            SizedBox(
              height: 20,
            ),
            ApiDataWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _fetchData() {
    ref.read(apiDataStateProvider.notifier).loadData();
  }
}

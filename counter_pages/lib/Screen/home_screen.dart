import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:counter_pages/counter_store.dart';

class HomeScreen extends StatelessWidget {
  final CounterStore counterStore;

  const HomeScreen({Key? key, required this.counterStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Count:',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          Observer(
            builder: (_) {
              return Text(
                '${counterStore.count}',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildFloatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => counterStore.increment(),
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          onPressed: () => counterStore.decrement(),
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

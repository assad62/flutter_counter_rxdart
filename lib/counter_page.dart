// counter_page.dart
import 'package:flutter/material.dart';

import 'counter_intent.dart';
import 'counter_state.dart';
import 'counter_viewmodel.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _model = CounterViewModel();

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<CounterState>(
              stream: _model.state,
              builder: (context, snapshot) {
                final count = snapshot.data?.count ?? 0;
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _model.intent.add(const IncrementIntent()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
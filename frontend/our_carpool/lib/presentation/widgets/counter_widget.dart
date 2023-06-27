import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../business/counter_manager.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You have pushed the button this many times:'),
        Consumer<CounterManager>(
          builder: (context, counter, child) => Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              var counter = context.read<CounterManager>();
              counter.increment();
            },
            child: const Text("Increment"))
      ],
    );
  }
}

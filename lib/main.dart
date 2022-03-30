import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget{
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterCubit _cubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Hello Cubit')),
      body: BlocBuilder<CounterCubit, int>(builder: (context, state) => Center(child: Text('$state'))),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: _cubit.increment, child: const Icon(Icons.add),),
          const SizedBox(height: 5.0),
          FloatingActionButton(onPressed: _cubit.decrement, child: const Icon(Icons.remove),)
        ],
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int counter;

  const CounterState({required this.counter});

}

class CounterInitial extends CounterState {
  const CounterInitial({required int counter}) : super(counter: counter);
  // return CounterState(counter :0);
}




// factory CounterState.initial(){
//   return CounterState(counter :0);
// }



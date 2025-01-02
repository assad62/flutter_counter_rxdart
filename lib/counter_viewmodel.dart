import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'counter_intent.dart';
import 'counter_state.dart';

@injectable
class CounterViewModel {
  CounterViewModel() {
    _intentSubject.stream.listen(_handleIntent);
  }

  final _stateSubject = BehaviorSubject<CounterState>.seeded(
    const CounterState(count: 0),
  );
  final _intentSubject = PublishSubject<CounterIntent>();

  Stream<CounterState> get state => _stateSubject.stream;
  Sink<CounterIntent> get intent => _intentSubject.sink;

  void _handleIntent(CounterIntent intent) {
    if (intent is IncrementIntent) {  // Changed from IncrementCounter
      final currentState = _stateSubject.value;
      _stateSubject.add(CounterState(count: currentState.count + 1));
    } else if (intent is DecrementIntent) {  // Changed from DecrementCounter
      final currentState = _stateSubject.value;
      _stateSubject.add(CounterState(count: currentState.count - 1));
    }
  }

  void dispose() {
    _stateSubject.close();
    _intentSubject.close();
  }
}
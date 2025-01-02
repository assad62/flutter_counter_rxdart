// counter_model.dart
import 'package:rxdart/rxdart.dart';

import 'counter_intent.dart';
import 'counter_state.dart';

class CounterViewModel {
  final _stateSubject = BehaviorSubject<CounterState>.seeded(
    const CounterState(count: 0),
  );
  final _intentSubject = PublishSubject<CounterIntent>();

  Stream<CounterState> get state => _stateSubject.stream;
  Sink<CounterIntent> get intent => _intentSubject.sink;

  CounterModel() {
    _intentSubject.stream.listen(_handleIntent);
  }

  void _handleIntent(CounterIntent intent) {
    switch (intent) {
      case IncrementIntent():
        final currentState = _stateSubject.value;
        _stateSubject.add(
          currentState.copyWith(count: currentState.count + 1),
        );
    }
  }

  void dispose() {
    _stateSubject.close();
    _intentSubject.close();
  }
}

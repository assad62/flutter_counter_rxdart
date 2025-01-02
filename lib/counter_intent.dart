// counter_intent.dart
sealed class CounterIntent {
  const CounterIntent();
}

class IncrementIntent extends CounterIntent {
  const IncrementIntent();
}
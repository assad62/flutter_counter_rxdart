sealed class CounterIntent {
  const CounterIntent();
}

class IncrementIntent extends CounterIntent {
  const IncrementIntent();
}

class DecrementIntent extends CounterIntent {
  const DecrementIntent();
}
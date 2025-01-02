class CounterState {
  final int count;

  const CounterState({required this.count});

  CounterState copyWith({int? count}) {
    return CounterState(
      count: count ?? this.count,
    );
  }

  @override
  String toString() => 'CounterState(count: $count)';
}
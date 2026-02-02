enum EventPriority {
  low,
  medium,
  high,
}

extension EventPriorityX on EventPriority {
  int get dbValue => index;

  static EventPriority fromDb(int value) =>
      EventPriority.values[value];
}

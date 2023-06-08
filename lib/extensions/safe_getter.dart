extension SafeGetter<E> on List<E> {
  /// Returns the element at [index], or `null` if [index] is unreachable.
  E? safeAt(final int index) =>
      index.isNegative || index >= length ? null : this[index];

  /// Returns the first element, or `null` if the list is empty.
  E? get safeFirst => isEmpty ? null : first;

  /// Returns the last element, or `null` if the list is empty.
  E? get safeLast => isEmpty ? null : last;
}

extension SafeGetter<T> on List<T> {
  /// Returns the element at [index] or `null` if it doesn't exist.
  T? at(int index) => (length <= index) ? null : this[index];
}

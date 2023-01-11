extension Indexer<T> on List<T> {
  /// Returns the element at the given index or null if it doesn't exist.
  T? at(int index) {
    if (length <= index) {
      return null;
    }

    return this[index];
  }
}

extension Casing on String {
  /// Returns [this] with only the first letter in uppercase.
  /// If [this] is empty, returns an empty string.
  String toCapitalized() =>
      isEmpty ? '' : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  /// Returns [this] with each individual word capitalized.
  String toTitleCase() => replaceAll(RegExp(" +"), ' ')
      .split(' ')
      .map((String word) => word.toCapitalized())
      .join(' ');
}

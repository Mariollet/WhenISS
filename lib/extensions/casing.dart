extension Casing on String {
  /// Returns this string capitalized.
  String toCapitalized() =>
      isEmpty ? this : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  /// Returns this string with each word capitalized.
  String toTitleCase() => replaceAll(RegExp(" +"), ' ')
      .split(' ')
      .map((final String word) => word.toCapitalized())
      .join(' ');
}

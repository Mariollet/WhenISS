extension BoolParser on String {
  /// Parses [this] as a boolean and returns its value.
  bool parseBool() => int.tryParse(this) == 1 || toLowerCase() == "true";
}

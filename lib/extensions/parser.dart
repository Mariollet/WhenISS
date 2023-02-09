extension Parser on bool {
  /// Parses [source] as a boolean and returns its value.
  bool parse(String source) =>
      int.parse(source) == 1 || source.toLowerCase() == "true";
}

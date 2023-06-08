import "package:flutter/services.dart";

extension Parser on String {
  /// Converts this hexadecimal string to a [Color].
  Color toHex() {
    final StringBuffer buffer = StringBuffer();

    // Write alpha channel
    if (length == 6 || length == 7) buffer.write("ff");

    // Write RGB channels
    buffer.write(substring(1));

    return Color(int.parse("$buffer", radix: 16));
  }
}

import "package:flutter/material.dart";

extension Hex on Color {
  static Color fromHex(String hex) {
    final StringBuffer buffer = StringBuffer();

    // Write alpha channel
    if (hex.length == 6 || hex.length == 7) buffer.write("ff");

    // Write RGB channels
    buffer.write(hex.substring(1));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

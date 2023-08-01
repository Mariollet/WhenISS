import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:package_info_plus/package_info_plus.dart";

final packageProvider = StateProvider<PackageInfo>(
  (_) => throw UnimplementedError,
);

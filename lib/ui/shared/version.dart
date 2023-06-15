import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:keole/services/index.dart";
import "package:keole/ui/view_model/index.dart";
import "package:package_info_plus/package_info_plus.dart";

const int copyrightYear = 2023;
final int currentYear = DateTime.now().year;

final String yearRange =
    "$copyrightYear${copyrightYear != currentYear ? "–$currentYear" : ''}";

class Version extends ConsumerWidget {
  const Version({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final String version = ref.watch(
      packageProvider.select(
        (final PackageInfo package) {
          if (Platform.isAndroid || Platform.isIOS) {
            return "${package.version}+${package.buildNumber}";
          } else {
            return package.version;
          }
        },
      ),
    );

    return Text(
      "© $yearRange Keole • $version",
      style: AppTextStyles.copyright,
      textAlign: TextAlign.center,
    );
  }
}

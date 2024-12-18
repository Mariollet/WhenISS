import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/services/index.dart";
import "package:wheniss/ui/view_model/index.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:url_launcher/url_launcher.dart";

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
        (final PackageInfo package) =>
            "${package.version}+${package.buildNumber}",
      ),
    );

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "© $yearRange",
            style: AppTextStyles.copyright,
          ),
          TextSpan(
            text: " Keole ",
            style: AppTextStyles.copyright,
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrl(Uri(
                    scheme: "https",
                    host: "www.studiokgokg.net",
                  )),
          ),
          TextSpan(
            text: "• $version",
            style: AppTextStyles.copyright,
          ),
        ],
      ),
      style: AppTextStyles.copyright,
      textAlign: TextAlign.center,
    );
  }
}

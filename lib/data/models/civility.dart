import "package:keole/services/services.dart";

enum Civility {
  mr(slug: "Monsieur"),
  mrs(slug: "Madame"),
  none(slug: "Ne se prononce pas");

  const Civility({required this.slug});

  final String slug;

  factory Civility.parse(final String civility) => switch (civility) {
        "Monsieur" => mr,
        "Madame" => mrs,
        "Ne se prononce pas" => none,
        _ => throw const FormatException(),
      };

  @override
  String toString() => switch (this) {
        mr => localizations.civilityMr,
        mrs => localizations.civilityMrs,
        none => localizations.civilityNone,
      };
}

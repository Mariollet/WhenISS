import "package:keole/services/services.dart";

enum Civility {
  mr(name: "Monsieur"),
  mrs(name: "Madame"),
  none(name: "Ne se prononce pas");

  const Civility({required this.name});

  final String name;

  factory Civility.parse(final String civility) => switch (civility) {
        "Monsieur" => mr,
        "Madame" => mrs,
        "Ne se prononce pas" => none,
        _ => throw FormatException,
      };

  @override
  String toString() => switch (this) {
        mr => localizations.civilityMr,
        mrs => localizations.civilityMrs,
        none => localizations.civilityNone,
      };
}

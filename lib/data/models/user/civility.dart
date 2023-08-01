import "package:keole/services/index.dart";

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
        _ => throw const FormatException("Invalid civility"),
      };

  static Civility? tryParse(final String civility) {
    try {
      return Civility.parse(civility);
    } on FormatException {
      return null;
    }
  }

  @override
  String toString() => switch (this) {
        mr => localizations.civilityMr,
        mrs => localizations.civilityMrs,
        none => localizations.civilityNone,
      };
}
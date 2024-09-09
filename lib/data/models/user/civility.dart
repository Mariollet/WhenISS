import "package:fl_starter/services/index.dart";

enum Civility {
  mr(name: "Monsieur"),
  mrs(name: "Madame"),
  none(name: "Ne se prononce pas");

  const Civility({required this.name});

  final String name;

  factory Civility.parse(final String civility) => switch (civility) {
        "male" => mr,
        "female" => mrs,
        "none" => none,
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

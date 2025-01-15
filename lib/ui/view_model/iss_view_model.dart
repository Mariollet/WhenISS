import "package:wheniss/data/models/iss_location.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wheniss/data/models/iss_visibility.dart";

final issLocationProvider = StateProvider<IssLocation?>((_) => null);

final issVisibilityProvider = StateProvider<List<IssVisibility>?>((_) => null);


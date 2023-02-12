## Keole starter kit for Flutter projects.

> Format code in CI?

[Dart docs](https://dart.dev/guides) • [Flutter docs](https://docs.flutter.dev) • [pub.dev](https://pub.dev)  

### Dependencies

- [`context_holder`](https://pub.dev/documentation/context_holder/latest)
- [`cupertino_icons`](https://api.flutter.dev/flutter/cupertino/CupertinoIcons-class.html)
- [`flutter_dotenv`](https://pub.dev/documentation/flutter_dotenv/latest)
- [`flutter_riverpod`](https://riverpod.dev/docs/getting_started)
- [`flutter_secure_storage`](https://pub.dev/documentation/flutter_secure_storage/latest)
- [`http`](https://pub.dev/documentation/http/latest)
- [`intl`](https://pub.dev/documentation/intl/latest)

### Installation

After cloning the project, run `flutter pub get`. If the project uses a localization package, run also `flutter gen-l10n` (also, uncomment it in the CI).

#### Environment setup

Create a file named `.env.local` in the project root. This will be your local configuration. It must not be committed!  
The local environment must define the commented constants from the `.env`. Keep in mind that the Dart debugger must be restarted after changing an environment constant.

#### Debug mode

The constant `APP_DEBUG` determines the state of the project debug mode. **It must not be enabled from the global environment.** You can use it to make tests that won't show in production.

#### Font family

If you're changing the font family, set the new font name in `fontFamily` ([lib/services/app_text_styles.dart](https://github.com/keole/fl_starter/blob/master/lib/services/app_text_styles.dart)).

### Good practices

- Use the formatter provided by the Dart extension, or run `dart format ./lib && dart analyze` before committing.
- Document tasks with `// TODO: ...`. Todos are listed in the Problems section.
- When possible, prefer `Consumer` over `ConsumerWidget`/`ConsumerStatefulWidget`, and prefer `StatelessWidget` over `StatefulWidget`.
- Sort imports by alphabetical order. This is a style convention from the [Dart style guide](https://dart.dev/guides/language/effective-dart/style#do-sort-sections-alphabetically).
- In a class, write the constructor before the parameter declaration. This is a style convention from the [Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo#constructors-come-first-in-a-class).
- When creating a class instance, follow the parameter order from the constructor (except for `child` and `children` properties which should always be at the end).
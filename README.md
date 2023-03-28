## Keole starter kit for Flutter projects.

[Dart docs](https://dart.dev/guides) • [Flutter docs](https://docs.flutter.dev) • [pub.dev](https://pub.dev)

### Installation

1. `flutter pub get`
2. `flutter gen-l10n` if the project uses a localization package. You can also uncomment this command in the CI.

#### Environment setup

1. Create a file named `.env.local` in the project root. This will be your local configuration.
2. Copy the commented variables of the `.env` to the `.env.local`.
3. Uncomment the line registering the file in `pubspec.yaml`.

_Note: Changing an environment variable requires a restart of the Dart debugger._

#### Debug mode

The constant `APP_DEBUG` determines the state of the project debug mode. **It must not be enabled from the global environment.** You can use it to make tests that won't show in production.

### Good practices

- Use the formatter provided by the Dart extension, or run `dart format ./lib && dart analyze` before committing.
- Document tasks with `// TODO: ...`. Todos are listed in the Problems section of the editor.
- When possible, prefer `Consumer` over `ConsumerWidget`/`ConsumerStatefulWidget`, and prefer `StatelessWidget` over `StatefulWidget`.
- When only one view uses a custom widget such as a text input or a button, consider defining the widget in a private class (starting with `_`) below the view widget.
- Sort imports by alphabetical order. This is a style convention from the [Dart style guide](https://dart.dev/guides/language/effective-dart/style#do-sort-sections-alphabetically).
- In a class, write the constructor before the parameter declaration. This is a style convention from the [Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo#constructors-come-first-in-a-class).
- When creating a class instance, follow the parameter order from the constructor (except for the `child` and `children` properties which should always be at the end).
## Keole starter kit for Flutter projects.

[Dart docs](https://dart.dev/guides) • [Flutter docs](https://docs.flutter.dev) • [pub.dev](https://pub.dev)

### Setup

1. `flutter pub get`
2. Generate environment
3. Generate translations

### Environment

Regenerate environment variables (no debugger restart required):
```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### Internationalization

Generate translations:
```bash
flutter gen-l10n
```

### Good practices

- Use the formatter provided by the Dart extension, or run `dart format ./lib && dart analyze` before committing.
- Document tasks with `// TODO` and bugs with `// FIXME`. These comments are listed in the Problems section of the editor.
- When possible, prefer `Consumer` over `ConsumerWidget`/`ConsumerStatefulWidget`, and prefer `StatelessWidget` over `StatefulWidget`.
- When a widget is used by a single view, consider declaring its private class in the same file.
- Sort imports by alphabetical order (style convention from the [Dart style guide](https://dart.dev/guides/language/effective-dart/style#do-sort-sections-alphabetically)).
- In a class, write the constructor before the parameter declaration (style convention from the [Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo#constructors-come-first-in-a-class)).
- When instantiating a class, follow the parameter order of the constructor (except for the `child` and `children` properties which should always be at the end).

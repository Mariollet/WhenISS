## Keole starter kit for Flutter projects.

- [Dart documentation](https://dart.dev/guides)
- [Flutter documentation](https://docs.flutter.dev)
- [Dart packages](https://pub.dev)
- [Riverpod documentation](https://riverpod.dev/docs/getting_started)

> @todo: Info about .env and base URLs  
> @todo: Info about debug mode  
> @todo: Flutter good practices  
> @todo: API error codes

### Installation

The project requires an `.env.local` file with the variables `APP_BASE_URL` and `APP_DEBUG`.

### API error codes

| Code | Description |
| --- | --- |
| `0x01` | Connection refused or CORS error. The response did not reach the client. |

### Good practices

- Use the formatter provided by the Dart extension, or `dart format ./lib && dart analyze`.
- Document tasks with `// TODO: ...`. Todos are listed in the Problems section.
- When possible, prefer `Consumer` over `ConsumerWidget` or `ConsumerStatefulWidget`;
- Sort imports by alphabetical order. This is a style convention from the [Dart style guide](https://dart.dev/guides/language/effective-dart/style#do-sort-sections-alphabetically).
- In a class, write the constructor before the parameter declaration. This is a style convention from the [Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo#constructors-come-first-in-a-class).
- When creating a class instance, follow the parameter order of the constructor (except for `child` and `children` properties which should always be at the end).
- Design Riverpod notifiers so that they support method cascades.
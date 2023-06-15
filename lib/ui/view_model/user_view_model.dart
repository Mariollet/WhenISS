import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:keole/data/models/user.dart';

final userProvider = StateProvider<User?>((_) => null);

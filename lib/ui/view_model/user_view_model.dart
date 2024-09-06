import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:fl_starter/data/models/user/user.dart';

final userProvider = StateProvider<User?>((_) => null);

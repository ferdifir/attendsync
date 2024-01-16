import 'package:attendsync/services/hive/hive_key.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveKey.BOX);
  }

  static bool isUserLoggedIn() {
    final box = Hive.box(HiveKey.BOX);
    return box.get(HiveKey.USER) != null;
  }

  static void saveUserToken(String token) {
    final box = Hive.box(HiveKey.BOX);
    box.put(HiveKey.USER, token);
  }

  static bool isAdmin() {
    final box = Hive.box(HiveKey.BOX);
    return box.get(HiveKey.USER_ROLE) == 'admin';
  }

  static void saveUserRole(String role) {
    final box = Hive.box(HiveKey.BOX);
    box.put(HiveKey.USER_ROLE, role);
  }
}

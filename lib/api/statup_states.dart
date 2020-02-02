import 'package:hive/hive.dart';

Future<bool> isLoggedIn() async {
  final Box<dynamic> box = await Hive.openBox("settings");
  if (box.isEmpty) {
    return false;
  } else {
    return box.get("isLoggedIn");
  }
}

Future<bool> hasSkipped() async {
  final Box<dynamic> box = await Hive.openBox("settings");
  if (box.isEmpty) {
    return false;
  } else {
    return box.get("hasSkipped");
  }
}

Future<bool> initConfig() async {
  final Box<dynamic> box = await Hive.openBox("settings");
  if (box.isEmpty) {
    box.put("hasSkipped", false);
    box.put("isLoggedIn", false);
    return true;
  } else {
    return false;
  }
}

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todos/data/models/auth_data.dart';

class Database {
  Box<AuthData> authDataBox;

  _initBoxes() async {
    authDataBox = await Hive.openBox("authData");
  }

  _registerAdapters() async {
    Hive.registerAdapter(AuthDataAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(CountryAdapter());
    Hive.registerAdapter(RegionAdapter());
    Hive.registerAdapter(UsertypeAdapter());
  }

  init() async {
    await Hive.initFlutter();
    _registerAdapters();
    _initBoxes();
  }
}

var db = Database();

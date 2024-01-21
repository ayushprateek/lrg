import 'package:miesp/common/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? localStorage;

  static LocalStorage? _ls;

  Future<void> initLocalStorage() async {
    localStorage ??= await SharedPreferences.getInstance();
  }

  static LocalStorage? getInstance() {
    _ls ??= LocalStorage();
    return _ls;
  }

  static setString({
    required String key,
    required String value,
  }) {
    _ls?.localStorage?.setString(key, value);
  }

  static setBool({
    required String key,
    required bool value,
  }) {
    _ls?.localStorage?.setBool(key, value);
  }

  static String? getString({required String key}) {
    return _ls?.localStorage?.getString(key) ?? '';
  }

  static bool? getBool({required String key}) {
    return _ls?.localStorage?.getBool(key);
  }

  static logout() {
    _ls?.localStorage?.setString(keyObjUser, '');
    _ls?.localStorage?.setString(keyLoginTime, '');
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static SharedPreferences? _pref;

  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static _ensureInitialized() {
    if (_pref == null) {
      throw StateError('Shared preference is not initialized');
    }
  }

  static String? getSessionToken() {
    _ensureInitialized();
    return _pref?.getString('sessionToken');
  }

  static Future storeSessionToken(String token) async {
    await _pref?.setString('sessionToken', token);
  }

  static Future removeSessionToken() async {
    await _pref?.remove('sessionToken');
  }

  // static Map<String, dynamic> getGamePlaySettings() {
  //   _ensureInitialized();
  //   String gamePlaySettingsToJson =
  //       _pref?.getString('game_play_settings') ?? "{}";

  //   return jsonDecode(
  //         gamePlaySettingsToJson,
  //       ) ??
  //       {};
  // }

  // static Future storeGamePlaySettings(Map<String, dynamic> valueMap) async {
  //   String? gamePlaySettingsToJson = jsonEncode(valueMap);
  //   await _pref?.setString('game_play_settings', gamePlaySettingsToJson);
  // }

  // static Future removeGamePlaySettings() async {
  //   await _pref?.remove('game_play_settings');
  // }
}

import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

String baseUrl = ConfigService.instance.getRemoteConfig('API');

class ConfigService {
  ConfigService._privateConstructor();

  static final ConfigService instance = ConfigService._privateConstructor();
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initConfig() async {
    await _remoteConfig.setDefaults({
      'API': 'https://infosys.fastaval.dk/api',
      'APItest': 'https://infosys-test.fastaval.dk/api',
      'dates': "[]",
      'info_screen_boxes': "[]",
      'service_opening_hours': "[]",
      'info_opening_hours': "[]"
    });
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: Duration(minutes: 1),
        minimumFetchInterval: Duration(hours: 1),
      ),
    );
    await _remoteConfig.fetchAndActivate();
  }

  String getRemoteConfig(String string) {
    return _remoteConfig.getString(string);
  }

  List<String> getDates() {
    String datesJson = _remoteConfig.getString('dates');
    List<dynamic> datesList = jsonDecode(datesJson);
    return datesList.map((date) => date.toString()).toList();
  }

  /// Returns the parsed `info_screen_boxes` JSON from Remote Config.
  /// Falls back to an empty list if parsing fails.
  List<dynamic> getInfoScreenBoxes() {
    try {
      String json = _remoteConfig.getString('info_screen_boxes');
      if (json.isEmpty) return [];
      return jsonDecode(json) as List<dynamic>;
    } catch (e) {
      return [];
    }
  }

  /// The remote config now contains a key `info_opening_hours` which is
  /// an array with objects for `serviceHours` and `storeHours`.
  /// These helpers parse and return maps suitable for UI use, with
  /// fallbacks to the constants in `AppConstants`.
  Map<String, Map<String, String>> getServiceOpeningHours() {
    try {
      String json = _remoteConfig.getString('info_opening_hours');
      if (json.isEmpty) return <String, Map<String, String>>{};
      List<dynamic> arr = jsonDecode(json) as List<dynamic>;
      final serviceObj = arr.firstWhere(
        (e) => e is Map && e.containsKey('serviceHours'),
        orElse: () => null,
      );
      if (serviceObj == null) return <String, Map<String, String>>{};
      final Map<String, dynamic> raw =
          Map<String, dynamic>.from(serviceObj['serviceHours']);
      return raw.map((k, v) => MapEntry(k, Map<String, String>.from(v)));
    } catch (e) {
      return <String, Map<String, String>>{};
    }
  }

  /// Returns store opening hours as a map where each value may contain
  /// nested structures (e.g. `title`, `location`, and a `days` array).
  /// Use callers should treat the value as `Map<String, dynamic>`.
  Map<String, dynamic> getStoreOpeningHours() {
    try {
      String json = _remoteConfig.getString('info_opening_hours');
      if (json.isEmpty) return <String, dynamic>{};
      List<dynamic> arr = jsonDecode(json) as List<dynamic>;
      final storeObj = arr.firstWhere(
        (e) => e is Map && e.containsKey('storeHours'),
        orElse: () => null,
      );
      if (storeObj == null) return <String, dynamic>{};
      final Map<String, dynamic> raw =
          Map<String, dynamic>.from(storeObj['storeHours']);
      // Ensure each store value is a Map<String, dynamic> when possible.
      return raw.map(
          (k, v) => MapEntry(k, v is Map ? Map<String, dynamic>.from(v) : v));
    } catch (e) {
      return <String, dynamic>{};
    }
  }
}

import 'package:fastaval_app/services/local_storage.service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('LocalStorageService Tests', () {
    late LocalStorageService storageService;

    setUp(() async {
      // Set up mock shared preferences
      SharedPreferences.setMockInitialValues({});
      storageService = LocalStorageService();
    });

    test('Should store and retrieve string value', () async {
      const key = 'test_key';
      const value = 'test_value';

      await storageService.setString(key, value);
      final retrievedValue = await storageService.getString(key);

      expect(retrievedValue, equals(value));
    });

    test('Should return empty string for non-existent key', () async {
      final retrievedValue = await storageService.getString('non_existent');

      expect(retrievedValue, equals(''));
    });

    test('Should delete stored value', () async {
      const key = 'test_remove';
      const value = 'to_be_removed';

      await storageService.setString(key, value);
      await storageService.deleteString(key);
      final retrievedValue = await storageService.getString(key);

      expect(retrievedValue, equals(''));
    });
  });
}


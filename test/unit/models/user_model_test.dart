import 'package:fastaval_app/models/user.model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Model Tests', () {
    test('User model should be created with default values', () {
      final user = User();

      expect(user.id, equals(0));
      expect(user.password, equals(''));
      expect(user.name, equals(''));
      expect(user.hasCheckedIn, isFalse);
      expect(user.category, equals(''));
      expect(user.barcode, equals(0));
      expect(user.food, isEmpty);
      expect(user.wear, isEmpty);
      expect(user.scheduling, isEmpty);
      expect(user.ottoParty, isEmpty);
    });

    test('User model should be created with custom values', () {
      final user = User(
        id: 123,
        password: 'test123',
        name: 'Test User',
        hasCheckedIn: true,
        category: 'VIP',
        barcode: 12345,
      );

      expect(user.id, equals(123));
      expect(user.name, equals('Test User'));
      expect(user.hasCheckedIn, isTrue);
      expect(user.category, equals('VIP'));
      expect(user.barcode, equals(12345));
    });

    test('User model should serialize to JSON correctly', () {
      final user = User(
        id: 123,
        password: 'test123',
        name: 'Test User',
        hasCheckedIn: true,
        category: 'VIP',
        barcode: 12345,
      );

      final json = user.toJson();

      expect(json['id'], equals(123));
      expect(json['name'], equals('Test User'));
      expect(json['password'], equals('test123'));
      expect(json['checked_in'], isTrue);
      expect(json['category'], equals('VIP'));
      expect(json['barcode'], equals(12345));
    });
  });
}

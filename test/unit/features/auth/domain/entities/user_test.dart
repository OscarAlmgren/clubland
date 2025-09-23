import 'package:flutter_test/flutter_test.dart';

import '../../../../../../lib/features/auth/domain/entities/user.dart';

void main() {
  group('User Entity', () {
    const testUser = User(
      id: '123',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      isVerified: true,
    );

    test('should create user with all properties', () {
      expect(testUser.id, '123');
      expect(testUser.email, 'test@example.com');
      expect(testUser.firstName, 'John');
      expect(testUser.lastName, 'Doe');
      expect(testUser.isVerified, true);
    });

    test('should get full name', () {
      expect(testUser.fullName, 'John Doe');
    });

    test('should get display name', () {
      expect(testUser.displayName, 'John Doe');
    });

    test('should support equality comparison', () {
      const user1 = User(
        id: '123',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        isVerified: true,
      );

      const user2 = User(
        id: '123',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        isVerified: true,
      );

      expect(user1, equals(user2));
    });

    test('should support inequality comparison', () {
      const user1 = User(
        id: '123',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        isVerified: true,
      );

      const user2 = User(
        id: '456',
        email: 'test2@example.com',
        firstName: 'Jane',
        lastName: 'Smith',
        isVerified: false,
      );

      expect(user1, isNot(equals(user2)));
    });

    test('should convert to string representation', () {
      final userString = testUser.toString();
      expect(userString, contains('User'));
      expect(userString, contains('123'));
      expect(userString, contains('test@example.com'));
    });
  });
}
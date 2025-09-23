import 'package:flutter_test/flutter_test.dart';

import 'package:clubland/features/auth/domain/entities/user_entity.dart';

void main() {
  group('UserEntity', () {
    final testUser = UserEntity(
      id: '123',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      status: UserStatus.active,
      createdAt: DateTime(2023, 1, 1),
    );

    test('should create user with all properties', () {
      expect(testUser.id, '123');
      expect(testUser.email, 'test@example.com');
      expect(testUser.firstName, 'John');
      expect(testUser.lastName, 'Doe');
      expect(testUser.status, UserStatus.active);
      expect(testUser.createdAt, DateTime(2023, 1, 1));
    });

    test('should get full name when both first and last name provided', () {
      expect(testUser.fullName, 'John Doe');
    });

    test('should get full name when only first name provided', () {
      final userWithFirstNameOnly = UserEntity(
        id: '123',
        email: 'test@example.com',
        firstName: 'John',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );
      expect(userWithFirstNameOnly.fullName, 'John');
    });

    test('should get full name when only last name provided', () {
      final userWithLastNameOnly = UserEntity(
        id: '123',
        email: 'test@example.com',
        lastName: 'Doe',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );
      expect(userWithLastNameOnly.fullName, 'Doe');
    });

    test('should get email as full name when no names provided', () {
      final userWithNoNames = UserEntity(
        id: '123',
        email: 'test@example.com',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );
      expect(userWithNoNames.fullName, 'test@example.com');
    });

    test('should get display name as username when provided', () {
      final userWithUsername = UserEntity(
        id: '123',
        email: 'test@example.com',
        username: 'johndoe',
        firstName: 'John',
        lastName: 'Doe',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );
      expect(userWithUsername.displayName, 'johndoe');
    });

    test('should get display name as full name when no username', () {
      expect(testUser.displayName, 'John Doe');
    });

    test('should check if user has specific role', () {
      final userWithRoles = UserEntity(
        id: '123',
        email: 'test@example.com',
        status: UserStatus.active,
        roles: ['admin', 'user'],
        createdAt: DateTime.now(),
      );

      expect(userWithRoles.hasRole('admin'), true);
      expect(userWithRoles.hasRole('user'), true);
      expect(userWithRoles.hasRole('moderator'), false);
    });

    test('should check if user has specific permission', () {
      final userWithPermissions = UserEntity(
        id: '123',
        email: 'test@example.com',
        status: UserStatus.active,
        permissions: ['read', 'write'],
        createdAt: DateTime.now(),
      );

      expect(userWithPermissions.hasPermission('read'), true);
      expect(userWithPermissions.hasPermission('write'), true);
      expect(userWithPermissions.hasPermission('delete'), false);
    });

    test('should support equality comparison', () {
      final user1 = UserEntity(
        id: '123',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        status: UserStatus.active,
        createdAt: DateTime(2023, 1, 1),
      );

      final user2 = UserEntity(
        id: '123',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        status: UserStatus.active,
        createdAt: DateTime(2023, 1, 1),
      );

      expect(user1, equals(user2));
    });

    test('should support inequality comparison', () {
      final user1 = UserEntity(
        id: '123',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );

      final user2 = UserEntity(
        id: '456',
        email: 'test2@example.com',
        firstName: 'Jane',
        lastName: 'Smith',
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );

      expect(user1, isNot(equals(user2)));
    });

    test('should have default values for optional fields', () {
      final minimalUser = UserEntity(
        id: '123',
        email: 'test@example.com',
        createdAt: DateTime.now(),
      );

      expect(minimalUser.username, isNull);
      expect(minimalUser.firstName, isNull);
      expect(minimalUser.lastName, isNull);
      expect(minimalUser.clubId, isNull);
      expect(minimalUser.status, UserStatus.active);
      expect(minimalUser.roles, isEmpty);
      expect(minimalUser.permissions, isEmpty);
      expect(minimalUser.profile, isNull);
      expect(minimalUser.updatedAt, isNull);
    });

    test('should convert to string representation', () {
      final userString = testUser.toString();
      expect(userString, contains('UserEntity'));
    });
  });
}
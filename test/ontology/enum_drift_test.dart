import 'dart:io';

import 'package:test/test.dart';

// Generated enum concept names that must NOT be re-declared as hand-rolled
// enums in lib/features/**. Update this list whenever a new Enum$* is added
// to the schema (i.e., when a new GraphQL enum is introduced).
const _generatedEnumNames = {
  'ClubEventType',
  'BookingStatus',
  'VisitStatus',
  'RSVPStatus',
  'RSVPResponse',
  'RSVPType',
  'GuestPolicy',
  'UserStatus',
  'FacilityType',
};

void main() {
  group('enum drift guard', () {
    test('no hand-rolled enum in lib/features shadows a generated Enum\$*', () {
      final featuresDir = Directory('lib/features');
      expect(featuresDir.existsSync(), isTrue,
          reason: 'Run this test from the repo root.');

      final violations = <String>[];

      for (final file in featuresDir
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.dart'))) {
        final lines = file.readAsLinesSync();
        for (var i = 0; i < lines.length; i++) {
          final line = lines[i];
          // Match bare `enum <Name>` declarations (not `Enum$` generated refs).
          final match =
              RegExp(r'^\s*enum\s+([A-Z][A-Za-z0-9]+)\s*\{').firstMatch(line);
          if (match == null) continue;
          final name = match.group(1)!;
          if (_generatedEnumNames.contains(name)) {
            violations.add('${file.path}:${i + 1} — '
                'hand-rolled `enum $name` shadows generated `Enum\$$name`. '
                'Use the generated type from package:clubland/core/graphql/graphql_api.dart');
          }
        }
      }

      expect(violations, isEmpty,
          reason: '\n${violations.join('\n')}');
    });
  });
}

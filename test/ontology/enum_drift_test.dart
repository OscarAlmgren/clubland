import 'dart:io';

import 'package:test/test.dart';

/// Extracts every enum name declared in the canonical GraphQL schema.
///
/// These are the names that graphql_codegen generates as `Enum$<Name>`, and
/// that therefore must never be re-declared as hand-rolled enums in
/// lib/features/**. Deriving the list from the schema (instead of a
/// hand-maintained set) means new schema enums are guarded automatically.
Set<String> _schemaEnumNames() {
  final schemaFile = File('lib/schema/schema.graphql');
  expect(schemaFile.existsSync(), isTrue,
      reason: 'lib/schema/schema.graphql missing — run scripts/sync-schema.sh');

  return RegExp(r'^enum\s+([A-Za-z0-9_]+)', multiLine: true)
      .allMatches(schemaFile.readAsStringSync())
      .map((m) => m.group(1)!)
      .toSet();
}

void main() {
  group('enum drift guard', () {
    test('schema contains enums to guard', () {
      // Sanity check: an empty set would silently disable the guard.
      final names = _schemaEnumNames();
      expect(names.length, greaterThanOrEqualTo(30),
          reason: 'Suspiciously few enums parsed from schema.graphql '
              '(${names.length}) — check the schema sync and the regex.');
    });

    test(r'no hand-rolled enum in lib/features shadows a generated Enum$*',
        () {
      final generatedEnumNames = _schemaEnumNames();

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
          if (generatedEnumNames.contains(name)) {
            violations.add('${file.path}:${i + 1} — '
                'hand-rolled `enum $name` shadows generated `Enum\$$name`. '
                'Use the generated type from package:clubland/core/graphql/graphql_api.dart');
          }
        }
      }

      expect(violations, isEmpty, reason: '\n${violations.join('\n')}');
    });
  });
}

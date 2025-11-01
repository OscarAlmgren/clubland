import 'package:flutter/material.dart';

/// A compact loading indicator widget designed for use in paginated lists.
///
/// Displays a centered [CircularProgressIndicator] with vertical padding.
class PaginationLoadingWidget extends StatelessWidget {
  /// Constructs a [PaginationLoadingWidget].
  const PaginationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

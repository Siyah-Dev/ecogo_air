import 'package:flutter/material.dart';

class PreferencesSection extends StatelessWidget {
  final bool direct;
  final bool student;
  final bool senior;
  final ValueChanged<bool> onDirectChanged;
  final ValueChanged<bool> onStudentChanged;
  final ValueChanged<bool> onSeniorChanged;

  const PreferencesSection({
    super.key,
    required this.direct,
    required this.student,
    required this.senior,
    required this.onDirectChanged,
    required this.onStudentChanged,
    required this.onSeniorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: [
        FilterChip(
          label: const Text('DIRECT FLIGHTS'),
          selected: direct,
          onSelected: onDirectChanged,
        ),
        FilterChip(
          label: const Text('STUDENT'),
          selected: student,
          onSelected: onStudentChanged,
        ),
        FilterChip(
          label: const Text('SENIOR CITIZEN'),
          selected: senior,
          onSelected: onSeniorChanged,
        ),
      ],
    );
  }
}

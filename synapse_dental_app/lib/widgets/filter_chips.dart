import 'package:flutter/material.dart';

class FilterChipsWidget extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const FilterChipsWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Doctor', 'Clinic', 'Hospital'];

    return Wrap(
      spacing: 8,
      children: filters.map((filter) {
        return ChoiceChip(
          label: Text(filter),
          selected: selectedFilter == filter,
          onSelected: (_) => onFilterSelected(filter),
        );
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';

class yearDropdown extends StatelessWidget {
  final String selectedYear;
  final Function(String) onChanged;

  yearDropdown({super.key, required this.selectedYear, required this.onChanged});

  final List<String> options = [
    '2019',
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: DropdownButtonFormField(
        value: selectedYear,
        onChanged: (value) => onChanged(value.toString()),
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Select Year',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

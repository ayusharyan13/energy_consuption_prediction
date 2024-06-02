import 'package:flutter/material.dart';

class PowerCategoryDropdown extends StatelessWidget {
  final String selectedPowerCategory;
  final Function(String) onChanged;

  PowerCategoryDropdown({super.key, required this.selectedPowerCategory, required this.onChanged});

  final List<String> powerCategories = [
    'Electricity generation',
    'Power sector emissions',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: DropdownButtonFormField(
        value: selectedPowerCategory,
        onChanged: (value) => onChanged(value.toString()),
        items: powerCategories.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Select Category',

          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

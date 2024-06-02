import 'package:flutter/material.dart';

class SubcategoryDropdown extends StatelessWidget {
  final String? selectedSubCategory;
  final Function(String)? onChanged;

  SubcategoryDropdown({super.key, this.selectedSubCategory, this.onChanged});

  final List<String> subcategories = [
    'Aggregate fuel', 'Fuel', 'Total', 'CO2 intensity'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: DropdownButtonFormField(
        value: selectedSubCategory,
        items: subcategories.map<DropdownMenuItem<String>>((String subcategory) {
          return DropdownMenuItem<String>(
            value: subcategory,
            child: Text(subcategory),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Select Subcategory',
          border: OutlineInputBorder(),
        ), onChanged: (String? value) {

      },
      ),
    );
  }
}

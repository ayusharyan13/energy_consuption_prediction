import 'package:flutter/material.dart';

class RegionDropdown extends StatelessWidget {
  final String selectedRegion;
  final Function(String) onChanged;

  RegionDropdown({super.key, required this.selectedRegion, required this.onChanged});

  final List<String> regions = [
    'North',
    'East',
    'West',
    'South',
  ];



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: DropdownButtonFormField(
        value: selectedRegion,
        onChanged: (value) => onChanged(value.toString(),),
        items: regions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Select Region',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

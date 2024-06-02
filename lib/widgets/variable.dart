import 'package:flutter/material.dart';

class VariableFossilDropdown extends StatelessWidget {
  final String selectedVaraiable;
  final Function(String) onChanged;

  VariableFossilDropdown({super.key, required this.selectedVaraiable, required this.onChanged});

  final List<String> options = [
    'Clean',
    'Fossil',
    'Gas and Other Fossil',
    'Hydro,Bioenergy and Other Renewables',
    'Renewables',
    'Wind and Solar',
    'Bioenergy',
    'Coal',
    'Gas',
    'Hydro',
    'Nuclear',
    'Other Fossil',
    'Other Renewables',
    'Solar',
    'Wind',
    'Total Generation',
    'CO2 intensity',
    'Total emissions',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: DropdownButtonFormField(
        value: selectedVaraiable,
        onChanged: (value) => onChanged(value.toString()),
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Select variable',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

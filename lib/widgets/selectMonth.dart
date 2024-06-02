import 'package:flutter/material.dart';

class MonthDropdown extends StatelessWidget {
  final String? selectedMonth;
  final Function(String)? onChanged;

  MonthDropdown({super.key, this.selectedMonth, this.onChanged});

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: DropdownButtonFormField(
        value: selectedMonth,
        items: months.map<DropdownMenuItem<String>>((String month) {
          return DropdownMenuItem<String>(
            value: month,
            child: Text(month),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Select Month',
          border: OutlineInputBorder(),
        ), onChanged: (String? value) {

      },
      ),
    );
  }
}

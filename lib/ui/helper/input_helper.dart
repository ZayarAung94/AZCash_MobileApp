import 'package:flutter/material.dart';

class AppInput {
  static Widget selectedMenu({
    required List<String> list,
    required void Function(String?)? onChange,
    required String? value,
    String? label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label ?? "Label",
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
        DropdownButton(
          padding: const EdgeInsets.all(0),
          value: value,
          isExpanded: true,
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChange,
        ),
      ],
    );
  }
}

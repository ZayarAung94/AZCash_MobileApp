import 'package:flutter/material.dart';

class AppWidget {
  static Widget oneDataRow({
    required String label1,
    required String value1,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label1,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(value1),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  static Widget twoDataRow({
    required String label1,
    required String label2,
    required String value1,
    required String value2,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label1,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(value1),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label2,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(value2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget dataCard({
    required String title,
    required Widget body,
  }) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 10,
      child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              body
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';

class AppBtn {
  static expendedBtn({
    required Color color,
    required String label,
    Function()? onPressed,
  }) {
    return MaterialButton(
      color: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }

  static normalBtn({
    required Color color,
    required String label,
    Function()? onPressed,
  }) {
    return MaterialButton(
      color: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
        child: Text(label),
      ),
    );
  }
}

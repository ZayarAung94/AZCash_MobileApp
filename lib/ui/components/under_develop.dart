import 'package:flutter/material.dart';

class UnderDevelop extends StatelessWidget {
  const UnderDevelop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset('lib/assets/images/under_matainance.png'),
          ),
          const Text(
            "This Function is still developing...",
          ),
          const Text(
            "We are trying to come in next Version.",
          ),
        ],
      ),
    );
  }
}

import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:flutter/material.dart';

class MasterModAgents extends StatelessWidget {
  const MasterModAgents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Agent's Name"),
                      Text("(123456789)"),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: AppBtn.expendedBtn(
            color: Colors.green.shade900,
            label: "Add Agent",
          ),
        ),
      ],
    );
  }
}

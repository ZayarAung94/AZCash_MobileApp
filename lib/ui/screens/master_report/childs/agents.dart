import 'package:az_cash/ui/dialogs/dialog_helper.dart';
import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
              return GestureDetector(
                onLongPress: () {
                  Get.dialog(
                    AppDialog.defaultDialog(
                      title: "Delete Agent Profile",
                      body: Column(
                        children: [
                          const Text(
                            "Are you sure to delete this agent profile? After delete agent, you can add again anytime.",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          AppWidget.oneDataRow(
                            label1: "Agent's Name :",
                            value1: "value1",
                            underline: false,
                          ),
                          AppWidget.oneDataRow(
                            label1: "Joind Date :",
                            value1: "value1",
                            underline: false,
                          ),
                        ],
                      ),
                      submitBtnText: "Delete",
                      btnColor: Colors.red.shade800,
                    ),
                  );
                },
                child: Card(
                  elevation: 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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

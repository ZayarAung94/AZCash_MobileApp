import 'package:az_cash/database/controllers/agent_controller.dart';
import 'package:az_cash/database/models/agent.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../agent_childs/agent_payments.dart';

class MasterModAgents extends StatelessWidget {
  const MasterModAgents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: AgentController().getAgents(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done) {
                List<AgentModel> agents = snap.data ?? [];
                return ListView.builder(
                  itemCount: agents.length,
                  itemBuilder: (context, index) {
                    AgentModel agent = agents[index];
                    return GestureDetector(
                      onTap: () {
                        // showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled: true,
                        //   builder: (context) {
                        //     return const AgentManage();
                        //   },
                        // );

                        Get.to(() => AgentPayments(agent: agent));
                      },
                      child: Card(
                        elevation: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      agent.name,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      agent.email,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: Text(
                                  "(${agent.role})",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return AppWidget.loading();
              }
            },
          ),
        ),
      ],
    );
  }
}

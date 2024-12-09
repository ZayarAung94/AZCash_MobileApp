import 'package:az_cash/database/controllers/client_controller.dart';
import 'package:az_cash/database/models/client.dart';
import 'package:az_cash/ui/helper/widget_helper.dart';
import 'package:az_cash/ui/screens/user_manage/childs/user_detail.dart';
import 'package:az_cash/ui/screens/user_manage/components/add_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class UserManageScreen extends StatefulWidget {
  const UserManageScreen({super.key});

  @override
  State<UserManageScreen> createState() => _UserManageScreenState();
}

class _UserManageScreenState extends State<UserManageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBg,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var res = await Get.dialog(const AddUserDialog());

          if (res == "reload") {
            setState(() {});
          }
        },
        child: const Icon(Icons.group_add),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      hintText: "Search by ID...",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ClientController().getClient(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.done) {
                  List<ClientModel>? clients = snap.data;
                  return ListView.builder(
                    itemCount: clients?.length,
                    itemBuilder: (context, index) {
                      ClientModel user = clients![index];
                      return GestureDetector(
                        onTap: () async {
                          var result = await Get.to(() => UserDetailScreen(user: user));

                          if (result == "updated") setState(() {});
                        },
                        child: Card(
                          margin: EdgeInsets.only(
                            left: 8.0,
                            right: 8,
                            bottom: index == 9 ? 50 : 8,
                          ),
                          color: AppColors.background,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text("(${user.id})")
                                      ],
                                    ),
                                    Text(user.agentCode),
                                  ],
                                )
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
      ),
    );
  }
}

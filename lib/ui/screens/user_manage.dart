import 'package:az_cash/ui/screens/childs/user_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

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
        onPressed: () {},
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
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    var result = await Get.to(() => const UserDetailScreen());

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
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "user.userName",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text("({user.userId})")
                                ],
                              ),
                              Text("Normal")
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:az_cash/database/controllers/users_controllers.dart';
import 'package:az_cash/database/database.dart';
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            width: double.infinity,
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
          Expanded(
            child: FutureBuilder(
                future: UsersController().getAll(),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.done) {
                    List<User> data = snap.data;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        User user = data[index];
                        return GestureDetector(
                          onTap: () async {
                            var result = await Get.to(() => UserDetailScreen(user: user));

                            if (result == "updated") setState(() {});
                          },
                          child: Card(
                            margin: const EdgeInsets.only(
                              left: 8.0,
                              right: 8,
                              bottom: 8,
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
                                            user.userName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text("(${user.userId})")
                                        ],
                                      ),
                                      const Text("Normal")
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
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 100),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                        SizedBox(height: 10),
                        Text('Loading...')
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/screens/childs/credit_history.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = TextEditingController();
    final phoneC = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.softBg,
        title: const Text("User Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person_3_rounded,
                size: 90,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "User ID : 11111",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Text(
              "Normal",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 25),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      "User Data",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    detailInput(
                      label: "User Name",
                      intValue: "Name",
                      controller: userName,
                    ),
                    detailInput(
                      label: "Phone Number",
                      intValue: "user.phone",
                      controller: phoneC,
                    ),
                    detailInput(
                      label: "Joind Date",
                      readOnly: true,
                      intValue: DateFormat("dd MMMM, yyyy").format(DateTime.now()),
                    ),
                    detailInput(
                      label: "Last Transition",
                      readOnly: true,
                      intValue: DateFormat("dd MMMM, yyyy").format(DateTime.now()),
                    ),
                    const SizedBox(height: 25),
                    AppBtn.expendedBtn(
                      color: Colors.green.shade800,
                      label: "Update Profile",
                      onPressed: () async {
                        // String name = userName.text.trim() == "" ? user.userName : userName.text.trim();
                        // String phone = phoneC.text.trim() == "" ? user.phone : phoneC.text.trim();
                        // bool isPartner = partner ?? user.isPartner;

                        // UsersController()
                        //     .updateUserProfile(
                        //   id: user.id,
                        //   name: name,
                        //   phone: phone,
                        //   isPartner: isPartner,
                        // )
                        //     .then(
                        //   (v) {
                        //     Future.delayed(
                        //       const Duration(milliseconds: 500),
                        //       () {
                        //         Get.back(result: "updated");
                        //       },
                        //     );
                        //   },
                        // );
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      "Finicial Data",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    detailInput(
                      label: "Total Credit",
                      readOnly: true,
                      intValue: NumberFormat("#,##0").format(100000),
                    ),
                    detailInput(
                      label: "Last Credit Date",
                      readOnly: true,
                      intValue: DateFormat("dd MMMM, yyyy").format(DateTime.now()),
                    ),
                    detailInput(
                      label: "Total Promotions",
                      readOnly: true,
                      intValue: NumberFormat("#,##0").format(1000),
                    ),
                    detailInput(
                      label: "Promotions Times",
                      readOnly: true,
                      intValue: NumberFormat("#,##0").format(10000),
                    ),
                    const SizedBox(height: 25),
                    // AppBtn.expendedBtn(
                    //   color: Colors.red.shade800,
                    //   label: "Add Credit Amount",
                    //   onPressed: () {
                    //     showModalBottomSheet(
                    //       context: context,
                    //       isScrollControlled: true,
                    //       builder: (context) {
                    //         return const AddCredit();
                    //       },
                    //     );
                    //   },
                    // ),
                    AppBtn.expendedBtn(
                      color: Colors.grey,
                      label: "View Credit History",
                      onPressed: () {
                        Get.to(() => const CreditHistory());
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Card(
            //   margin: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Container(
            //     padding: const EdgeInsets.all(20),
            //     width: double.infinity,
            //     child: Column(
            //       children: [
            //         const Text(
            //           "Contacts Data",
            //           style: TextStyle(
            //             fontSize: 18,
            //             color: Colors.grey,
            //           ),
            //         ),
            //         const SizedBox(height: 15),
            //         detailInput(
            //           label: "Facebook Profile",
            //           intValue: "Null",
            //           linkOpen: true,
            //         ),
            //         detailInput(
            //           label: "Viber Number",
            //           intValue: "Null",
            //           linkOpen: true,
            //         ),
            //         detailInput(
            //           label: "Telegram Link",
            //           intValue: "Null",
            //           linkOpen: true,
            //         ),
            //         const SizedBox(height: 25),
            //         AppBtn.expendedBtn(
            //           color: Colors.blue.shade800,
            //           label: "Update Contacts",
            //           onPressed: () {
            //             AppMessage.requirePremium();
            //           },
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBtn.expendedBtn(
                color: Colors.yellow.shade800,
                label: "Warning User",
                onPressed: () {
                  AppMessage.requirePremium();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBtn.expendedBtn(
                color: Colors.red.shade800,
                label: "Block User",
                onPressed: () {
                  AppMessage.requirePremium();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBtn.expendedBtn(
                color: Colors.red.shade800,
                label: "Report to Server",
                onPressed: () {
                  AppMessage.requirePremium();
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Padding detailInput({
    required String label,
    String? intValue,
    bool? readOnly,
    bool? linkOpen = false,
    Function()? linkOpenClick,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextField(
        readOnly: readOnly ?? false,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffix: linkOpen!
              ? GestureDetector(
                  onTap: linkOpenClick,
                  child: const Icon(Icons.open_in_new),
                )
              : const SizedBox(),
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: intValue,
        ),
      ),
    );
  }
}

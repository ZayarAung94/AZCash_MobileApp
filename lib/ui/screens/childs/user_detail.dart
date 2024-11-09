import 'package:az_cash/database/controllers/users_controllers.dart';
import 'package:az_cash/database/database.dart';
import 'package:az_cash/ui/helper/btn_helper.dart';
import 'package:az_cash/ui/helper/input_helper.dart';
import 'package:az_cash/ui/screens/childs/credit_history.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final userName = TextEditingController();
    final phoneC = TextEditingController();
    bool? partner;

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
            Text(
              "User ID : ${user.userId}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              user.status,
              style: const TextStyle(
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
                      intValue: user.userName,
                      controller: userName,
                    ),
                    detailInput(
                      label: "Phone Number",
                      intValue: user.phone,
                      controller: phoneC,
                    ),
                    AppInput.selectedMenu(
                      label: "Is Your Partner",
                      list: ["Yes", "No"],
                      onChange: (value) {
                        if (value == "Yes") {
                          partner = true;
                        } else {
                          partner = false;
                        }
                      },
                      value: user.isPartner ? "Yes" : "No",
                    ),
                    detailInput(
                      label: "Joind Date",
                      readOnly: true,
                      intValue:
                          DateFormat("dd MMMM, yyyy").format(user.joinedDate),
                    ),
                    detailInput(
                      label: "Last Transition",
                      readOnly: true,
                      intValue: DateFormat("dd MMMM, yyyy")
                          .format(user.lastTransition),
                    ),
                    const SizedBox(height: 25),
                    AppBtn.expendedBtn(
                        color: Colors.green.shade800,
                        label: "Update Profile",
                        onPressed: () async {
                          String name = userName.text.trim() == ""
                              ? user.userName
                              : userName.text.trim();
                          String phone = phoneC.text.trim() == ""
                              ? user.phone
                              : phoneC.text.trim();
                          bool isPartner = partner ?? user.isPartner;

                          UsersController().updateUserProfile(
                            id: user.id,
                            name: name,
                            phone: phone,
                            isPartner: isPartner,
                          );
                        })
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
                      intValue: NumberFormat("#,##0").format(user.totalCredit),
                    ),
                    detailInput(
                      label: "Last Credit Date",
                      readOnly: true,
                      intValue: DateFormat("dd MMMM, yyyy")
                          .format(user.lastCreditDate ?? user.joinedDate),
                    ),
                    detailInput(
                      label: "Total Promotions",
                      readOnly: true,
                      intValue:
                          NumberFormat("#,##0").format(user.totalPromotion),
                    ),
                    detailInput(
                      label: "Promotions Times",
                      readOnly: true,
                      intValue: NumberFormat("#,##0").format(user.totalCredit),
                    ),
                    const SizedBox(height: 25),
                    AppBtn.expendedBtn(
                      color: Colors.red.shade800,
                      label: "Add Credit Amount",
                      onPressed: () {},
                    ),
                    AppBtn.expendedBtn(
                      color: Colors.grey,
                      label: "View Credit History",
                      onPressed: () {
                        Get.to(() => CreditHistory(user: user));
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
                      "Contacts Data",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 15),
                    detailInput(
                      label: "Facebook Profile",
                      intValue: user.facebook ?? "Null",
                      linkOpen: true,
                    ),
                    detailInput(
                      label: "Viber Number",
                      intValue: user.viber ?? "Null",
                      linkOpen: true,
                    ),
                    detailInput(
                      label: "Telegram Link",
                      intValue: user.telegram ?? "Null",
                      linkOpen: true,
                    ),
                    const SizedBox(height: 25),
                    AppBtn.expendedBtn(
                      color: Colors.blue.shade800,
                      label: "Update Contacts",
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBtn.expendedBtn(
                color: Colors.yellow.shade800,
                label: "Warning User",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBtn.expendedBtn(
                color: Colors.red.shade800,
                label: "Block User",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppBtn.expendedBtn(
                color: Colors.red.shade800,
                label: "Report to Server",
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              "User ID : 123456789",
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
                    detailInput(label: "User Name", intValue: "Undifined"),
                    detailInput(label: "Phone Number"),
                    detailInput(
                      label: "Joind Date",
                      readOnly: true,
                      intValue: "05 July, 2023",
                    ),
                    detailInput(
                      label: "Last Transition",
                      readOnly: true,
                      intValue:
                          DateFormat("dd MMMM, yyyy").format(DateTime.now()),
                    ),
                    const SizedBox(height: 25),
                    MaterialButton(
                      color: Colors.green.shade800,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: Text("Save Data"),
                      ),
                    ),
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
                      intValue: "0",
                    ),
                    detailInput(
                      label: "Last Credit Date",
                      readOnly: true,
                      intValue: "12 August, 2024",
                    ),
                    const SizedBox(height: 10),
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
                      readOnly: true,
                      intValue: "0",
                    ),
                    detailInput(
                      label: "Viber Number",
                      readOnly: true,
                      intValue: "12 August, 2024",
                    ),
                    detailInput(
                      label: "Telegram Link",
                      readOnly: true,
                      intValue: "12 August, 2024",
                    ),
                    const SizedBox(height: 25),
                    MaterialButton(
                      color: AppColors.background,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: Text("Save Data"),
                      ),
                    ),
                  ],
                ),
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
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextField(
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          labelText: label,
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

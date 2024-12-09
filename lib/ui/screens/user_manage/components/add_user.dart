import 'package:az_cash/database/controllers/client_controller.dart';
import 'package:az_cash/database/models/client.dart';
import 'package:az_cash/ui/components/dialog_helper.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    final idRegExp = RegExp(r"^[0-9]{3,12}$");
    final usernameRegExp = RegExp(r"^[a-zA-Z]+(?:[ '-][a-zA-Z]+)*$");
    final phoneRegExp = RegExp(r"^[0-9]{7,12}$");

    return AppDialog.defaultDialog(
      title: "Add User",
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: idController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter 1xBet ID";
                }
                if (!idRegExp.hasMatch(value)) {
                  return "Enter a valid 1xBet ID.";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "1xBet ID",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            TextFormField(
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter User Name";
                }

                if (!usernameRegExp.hasMatch(value)) {
                  return "Enter a valid name.";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            TextFormField(
              controller: phoneController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter User's Phone";
                }
                if (!phoneRegExp.hasMatch(value)) {
                  return "Enter a valid User's Phone.";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Phone",
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
          ],
        ),
      ),
      submitBtnText: "Add",
      submitBtnTap: () async {
        if (formKey.currentState!.validate()) {
          ClientModel client = ClientModel(
            id: idController.text.trim(),
            name: nameController.text.trim(),
            phone: phoneController.text.trim(),
            agentCode: AppData.user?.agentCode ?? "",
          );

          await ClientController().addClient(client);
          Future.delayed(const Duration(milliseconds: 100), () {
            if (!Get.isSnackbarOpen) Get.back(result: "reload");
          });
        }
      },
    );
  }
}

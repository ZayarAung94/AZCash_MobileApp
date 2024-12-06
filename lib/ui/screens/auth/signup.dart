import 'package:az_cash/auth/auth.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:az_cash/ui/screens/auth/login.dart';
import 'package:az_cash/ui/screens/auth/opt_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showPasswd = true;
  bool isLoading = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

  bool checkData() {
    if (nameController.text.trim().length > 5 &&
        Validator.isEmail(emailController.text.trim()) &&
        phoneController.text.trim().length > 8 &&
        Validator.isPassword(passwdController.text.trim())) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity, height: 100),
              const CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.calculate_sharp,
                  size: 50,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "AZ Cash",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Create Account! Enjoy!"),
              const SizedBox(height: 30),
              signupInput(
                icon: Icons.person_3,
                hintText: "Name",
                controller: nameController,
              ),
              signupInput(
                icon: Icons.email,
                hintText: "Email",
                controller: emailController,
              ),
              signupInput(
                icon: Icons.phone_android,
                hintText: "Phone Numbar",
                controller: phoneController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: passwdController,
                  obscureText: showPasswd,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.softBg,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showPasswd = !showPasswd;
                        });
                      },
                      child: Icon(
                        showPasswd ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey[600],
                      ),
                    ),
                    hintText: "Password",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  if (checkData()) {
                    setState(() {
                      isLoading = false;
                    });

                    try {
                      await Auth().register(
                        email: emailController.text.trim(),
                        passwd: passwdController.text.trim(),
                        name: nameController.text.trim(),
                        phone: phoneController.text.trim(),
                      );

                      Get.to(() => OptLogin(email: emailController.text.trim()));
                    } catch (e) {
                      AppMessage.error(e.toString());
                    } finally {
                      setState(() {
                        isLoading = true;
                      });
                    }
                  } else {
                    AppMessage.error("Enter valide value in required input field.");
                  }
                },
                color: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                  child: isLoading
                      ? const Text("SIGN UP")
                      : const SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have account. "),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(
                      'Login!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding signupInput({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.softBg,
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}

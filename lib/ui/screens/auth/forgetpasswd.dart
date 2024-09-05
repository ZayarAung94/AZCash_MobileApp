import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:az_cash/ui/screens/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class ForgetpasswdScreen extends StatefulWidget {
  const ForgetpasswdScreen({super.key});

  @override
  State<ForgetpasswdScreen> createState() => _ForgetpasswdScreenState();
}

class _ForgetpasswdScreenState extends State<ForgetpasswdScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool showPasswd = true;
  bool isLoading = true;
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
                radius: 50,
                child: Icon(
                  Icons.calculate_sharp,
                  size: 80,
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
              const Text("Forget Password!"),
              const SizedBox(height: 30),
              signupInput(icon: Icons.email, hintText: "Email"),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  if (Validator.isEmail(_emailController.text.trim())) {
                    setState(() {
                      isLoading = false;
                    });
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailController.text.trim())
                          .then((_) {
                        AppMessage.normal(
                            title: "Email has been send!!",
                            message:
                                "Email has been send to ${_emailController.text}. Please Check and Change Password.");
                      });
                    } on FirebaseAuthException catch (e) {
                      AppMessage.error(e.message ?? "Request Error");
                    } finally {
                      setState(() {
                        isLoading = true;
                      });
                    }
                  } else {
                    AppMessage.error("Enter Your email address!!!");
                  }
                },
                color: Colors.red,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: isLoading
                      ? const Text("Request")
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
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.softBg,
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}

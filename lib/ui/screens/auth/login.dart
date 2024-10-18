import 'package:az_cash/firebase/models/f_user.dart';
import 'package:az_cash/firebase/models/f_user_controller.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:az_cash/ui/helper/snack.dart';
import 'package:az_cash/ui/helper/validator.dart';
import 'package:az_cash/ui/screens/auth/forgetpasswd.dart';
import 'package:az_cash/ui/screens/auth/signup.dart';
import 'package:az_cash/ui/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwdController = TextEditingController();

  bool showPasswd = true;
  bool isLoading = true;

  Future saveAccount() async {
    final SharedPreferences spStore = await SharedPreferences.getInstance();

    await spStore.setString('email', _emailController.text.trim());
    await spStore.setString('passwd', _passwdController.text.trim());
  }

  @override
  void initState() {
    super.initState();

    Future loadSaveAccount() async {
      final SharedPreferences spStore = await SharedPreferences.getInstance();

      String? email = spStore.getString('email');
      String? passwd = spStore.getString('passwd');

      if (email != null && passwd != null) {
        _emailController.text = email;
        _passwdController.text = passwd;
      }
    }

    loadSaveAccount();
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
              const Text("Welcome Back! And Enjoy!"),
              const SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.softBg,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: _passwdController,
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
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  if (isLoading) {
                    if (Validator.isEmail(_emailController.text) &&
                        Validator.isPassword(_passwdController.text)) {
                      setState(() {
                        isLoading = false;
                      });

                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: _emailController.text.trim(),
                          password: _passwdController.text.trim(),
                        )
                            .then((_) async {
                          FUser user = await FUserController.getUser(
                              _emailController.text.trim());

                          if (user.device == null || user.device == "") {
                            FUserController.setDevice(user.email);
                          } else {
                            if (!await FUserController.checkDevice(user)) {
                              await FirebaseAuth.instance.signOut();
                              AppMessage.error(
                                  "This account is login on Other Device. ${user.device}.");
                              return;
                            }
                          }

                          AppData.email = _emailController.text.trim();
                          AppData.phone = user.phone;
                          AppData.userName = user.name;
                          AppData.device = user.device ?? "Unverified";
                          AppData.level = user.level;

                          saveAccount();
                          Get.offAll(() => const MainScreen());
                        });
                      } on FirebaseAuthException catch (e) {
                        AppMessage.error(e.message ?? "Login Error");
                      } finally {
                        setState(() {
                          isLoading = true;
                        });
                      }
                    } else {
                      AppMessage.error(
                        'Enter validate data or Created New Account!!!',
                      );
                    }
                  }
                },
                color: Colors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10),
                  child: isLoading
                      ? const Text("LOGIN")
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
                  const Text("Created Account. "),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: const Text(
                      'Sign up!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ForgetpasswdScreen());
                },
                child: const Text(
                  'Forget Password!',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

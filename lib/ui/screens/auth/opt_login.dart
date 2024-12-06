import 'dart:async';

import 'package:az_cash/auth/auth.dart';
import 'package:az_cash/ui/screens/auth/login.dart';
import 'package:az_cash/ui/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class OptLogin extends StatefulWidget {
  final String email;
  const OptLogin({super.key, required this.email});

  @override
  State<OptLogin> createState() => _OptLoginState();
}

class _OptLoginState extends State<OptLogin> {
  final TextEditingController _tokenController = TextEditingController();

  bool showPasswd = true;
  bool isLoading = true;

  int _seconds = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
              const SizedBox(height: 10),
              const Text(
                "OTP Verification!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We've send you the verification code on",
                textAlign: TextAlign.center,
              ),
              Text(
                widget.email,
                style: TextStyle(color: Colors.blue.shade400),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                child: TextField(
                  controller: _tokenController,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: AppColors.softBg,
                    hintText: "OPT Code",
                    counterText: "",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  if (isLoading = true) {
                    setState(() {
                      isLoading = false;
                    });

                    final res = await Auth().optLogin(
                      _tokenController.text.trim(),
                      widget.email,
                    );

                    if (res) {
                      Get.offAll(() => const MainScreen());
                    } else {
                      setState(() {
                        isLoading = true;
                      });
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
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
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
                  GestureDetector(
                    onTap: () {
                      if (_seconds == 0) {
                        Get.offAll(() => const LoginScreen());
                      }
                    },
                    child: const Text(
                      'Re-send code',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(" in $_seconds s!"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

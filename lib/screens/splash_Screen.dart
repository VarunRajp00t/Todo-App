import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constants/app_images.dart';
import 'package:todo_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  Future<void> splashTimer() async {
    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) return;

    Get.off(() => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Appimages.Logo, width: 120, height: 120),

              const SizedBox(height: 20),

              const Text(
                "Write your dreams..✍️",
                style: TextStyle(color: Color.fromARGB(255, 54, 207, 228), fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

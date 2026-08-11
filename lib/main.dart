import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/screens/splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Get.put(TodoController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber), useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}

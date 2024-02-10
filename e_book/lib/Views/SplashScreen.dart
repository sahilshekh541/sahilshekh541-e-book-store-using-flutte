import 'package:e_book/Controllers/Bookcontroller.dart';
import 'package:e_book/Views/HomePage.dart';
import 'package:e_book/Views/WelcomPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SPlashScreen extends StatefulWidget {
  const SPlashScreen({super.key});

  @override
  State<SPlashScreen> createState() => _SPlashScreenState();
}

class _SPlashScreenState extends State<SPlashScreen> {
  final auth = FirebaseAuth.instance;
  BookController bookController = Get.put(BookController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      if (auth.currentUser != null) {
        Get.offAll(const HomePage());
      } else {
        Get.offAll(const WelcomePage());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(child: Lottie.asset('Assets/Animations/book_anim.json')),
    );
  }
}

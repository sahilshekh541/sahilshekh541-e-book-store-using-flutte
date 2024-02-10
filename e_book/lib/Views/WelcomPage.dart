import 'package:e_book/Components/Buttons.dart';
import 'package:e_book/Controllers/googleAuthController.dart';
import 'package:e_book/Models/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                color: primarycolor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('Assets/Images/book.png'),
                    const SizedBox(
                      height: 50,
                    ),
                    Text("E - Book Store",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "Here you can find best book for you and you can also read book and listens book",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white)),
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 50, 40, 0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Disclaimer',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'n publishing and graphic design,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: labelcolor),
                        )
                      ],
                    ),
                  ),
                  BottomAppBar(
                    elevation: 0,
                    child: Button(
                      text: 'CONTINUE',
                      function: onclick,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  onclick() {
    authController.signinWithEmail();
  }
}

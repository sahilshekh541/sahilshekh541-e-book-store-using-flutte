import 'package:e_book/Models/Colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final function;
  const Button({super.key, required this.text, required this.function});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: Size(MediaQuery.of(context).size.width - 30, 40),
            backgroundColor: primarycolor),
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('Assets/Icons/google.png'),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white, fontSize: 20),
            ),
          ],
        ));
  }
}

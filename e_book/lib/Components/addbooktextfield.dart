import 'package:e_book/Controllers/Bookcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class booktextfields extends StatelessWidget {
  final IconData icon;
  final TextEditingController? controller;
  final String title;
  const booktextfields({
    required this.icon,
    this.controller,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          hintStyle: Theme.of(context).textTheme.labelLarge,
          hintText: title,
          enabledBorder: InputBorder.none,
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
    );
  }
}

class addbookbutton extends StatefulWidget {
  final String text;

  final void Function() onPressed;
  const addbookbutton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  State<addbookbutton> createState() => _addbookbuttonState();
}

class _addbookbuttonState extends State<addbookbutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.upload,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.background,
                  ),
            ),
          ],
        ));
  }
}

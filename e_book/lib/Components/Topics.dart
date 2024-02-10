import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class TopicsBox extends StatelessWidget {
  final String icon;
  final String title;
  const TopicsBox({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image(
            image: Svg(icon),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(title, style: Theme.of(context).textTheme.labelMedium)
        ],
      ),
    );
  }
}

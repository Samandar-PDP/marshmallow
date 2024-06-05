import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title, required this.icon,required this.onClick});

  final String title;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onClick,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
            colors: [
              CupertinoColors.activeBlue,
              Colors.red,
              Colors.pinkAccent            ]
          )
        ),
        child: Row(
          children: [
            Text(title),
            Icon(icon)
          ],
        ),
      ),
    );
  }
}

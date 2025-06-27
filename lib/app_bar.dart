import 'package:flutter/material.dart';
import 'menu.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Split the title into "welcome" and the name
    final parts = title.split(' ');
    final welcome = parts.first;
    final name = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    return AppBar(
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$welcome ',
              style: const TextStyle(
                fontSize: 18, // Smaller font
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: name,
              style: const TextStyle(
                fontSize: 24, // Larger font
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
      elevation: 4,
      leading: const MenuButton(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
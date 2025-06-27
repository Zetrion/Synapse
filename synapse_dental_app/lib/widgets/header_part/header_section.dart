import 'package:flutter/material.dart';
import 'package:synapse_dental_app/widgets/header_part/search_bar.dart';
import 'location.dart';

class HeaderSection extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const HeaderSection({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFFD9DFFA),
            Color(0xFFD9DFFA),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Opacity(
                opacity: 0.5,
                // Uncomment and add your background image if needed
                // child: Image.asset(
                //   "assets/header_design.png",
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back, size: 28, color: Colors.black),
                  ],
                ),
                const SizedBox(height: 8),
                SearchBarWidget(onChanged: onChanged),
                const SizedBox(height: 16),
                const LocationSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

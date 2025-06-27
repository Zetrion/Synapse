import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.location_pin, color: Colors.black),
        SizedBox(width: 10),
        Text(
          "695121, Thiruvananthapuram",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}
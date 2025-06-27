import 'package:flutter/material.dart';

class NearbyPage extends StatelessWidget {
  const NearbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FIND NEARBY',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                _NearbyOption(
                  icon: Icons.local_hospital,
                  label: 'Hospitals\n& Clinic',
                ),
                _NearbyOption(
                  icon: Icons.person,
                  label: 'Doctors',
                ),
                _NearbyOption(
                  icon: Icons.local_pharmacy,
                  label: 'Pharmacy',
                ),
                _NearbyOption(
                  icon: Icons.science,
                  label: 'Labs',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NearbyOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const _NearbyOption({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey[200],
          child: Icon(
            icon,
            size: 28,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
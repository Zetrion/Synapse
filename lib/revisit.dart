import 'package:flutter/material.dart';

class RevisitPage extends StatelessWidget {
  const RevisitPage({Key? key}) : super(key: key);

  // Example doctor data
  final List<_Doctor> doctors = const [
    _Doctor(name: 'Dr. Smith', imageUrl: null),
    _Doctor(name: 'Dr. Patel', imageUrl: null),
    _Doctor(name: 'Dr. Lee', imageUrl: null),
    _Doctor(name: 'Dr. Gupta', imageUrl: null),
    _Doctor(name: 'Dr. Brown', imageUrl: null),
    _Doctor(name: 'Dr. Kim', imageUrl: null),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'VISIT AGAIN',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 110, // Enough for avatar + name
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: doctors.length,
                separatorBuilder: (context, index) => const SizedBox(width: 24),
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.blue[100],
                        child: doctor.imageUrl == null
                            ? const Icon(Icons.person, size: 36, color: Colors.blue)
                            : ClipOval(
                                child: Image.network(
                                  doctor.imageUrl!,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 70,
                        child: Text(
                          doctor.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Doctor {
  final String name;
  final String? imageUrl;

  const _Doctor({required this.name, this.imageUrl});
}
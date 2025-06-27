import 'package:flutter/material.dart';
import '../widgets/header_part/header_section.dart';
import '../widgets/booking_card.dart';

class BookingSelectionPage extends StatefulWidget {
  const BookingSelectionPage({super.key});

  @override
  State<BookingSelectionPage> createState() => _BookingSelectionPageState();
}

class _BookingSelectionPageState extends State<BookingSelectionPage> {
  final List<String> specialities = [
    'Orthodontist',
    'Cosmetic Dentist',
    'General Dentistry',
    'Multi-specialty',
  ];

  final List<String> hospitals = [
    'Smile Dental Clinic',
    'Apollo Dental Hospital',
    'Bright Dental',
  ];

  final List<String> symptoms = [
    'Toothache',
    'Bleeding Gums',
    'Cavity',
    'Braces',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(
                onChanged: (val) {
                  // Handle search input if needed
                },
              ),
              const SizedBox(height: 24),
              const Text(
                "Find Your Doctor",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              CategoryGridSection(
                title: "By Specialities",
                data: specialities.map((e) => {'name': e}).toList(),
              ),
              const SizedBox(height: 20),
              CategoryGridSection(
                title: "By Hospitals",
                data: hospitals.map((e) => {'name': e}).toList(),
              ),
              const SizedBox(height: 20),
              CategoryGridSection(
                title: "By Symptoms",
                data: symptoms.map((e) => {'name': e}).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

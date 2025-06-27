import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'menu.dart';
import 'services.dart';
import 'features.dart';
import 'nearby.dart';
import 'revisit.dart'; // <-- Import RevisitPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dental Hackathon',
      home: Scaffold(
        appBar: const CustomAppBar(title: 'welcome Simoy'),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ServicesPage(),
              const SizedBox(height: 32),
              FeaturesPage(),
              const SizedBox(height: 32),
              NearbyPage(),
              const SizedBox(height: 32),
              RevisitPage(), // <-- Add here
            ],
          ),
        ),
      ),
    );
  }
}
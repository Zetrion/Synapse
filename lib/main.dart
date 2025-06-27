import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'menu.dart';
import 'services.dart';
import 'revisit.dart'; // <-- Import

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
            children: [
              ServicesPage(),
              RevisitPage(), // <-- Add here if you want it below ServicesPage
            ],
          ),
        ),
      ),
    );
  }
}
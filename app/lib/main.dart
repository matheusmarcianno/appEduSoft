import 'package:app/pages/home_page.dart';
import 'package:app/pages/person_details_page.dart';
import 'package:app/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      routes: {
        AppRoutes.PERSON_DETAILS: (context) => const PersonDetailsPage(),
      },
    );
  }
}

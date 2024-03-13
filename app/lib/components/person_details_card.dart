// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class PersonDetailsCard extends StatelessWidget {
  String title;
  dynamic value;

  PersonDetailsCard({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.normal);

    return SizedBox(
      height: 50,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Text(
                title,
                style: textStyle,
              ),
              const SizedBox(width: 16),
              Text(
                value.toString(),
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

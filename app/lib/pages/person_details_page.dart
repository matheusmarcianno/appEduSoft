import 'package:app/components/person_details_card.dart';
import 'package:app/models/person.dart';
import 'package:flutter/material.dart';

class PersonDetailsPage extends StatelessWidget {
  const PersonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Person personArgs = ModalRoute.of(context)?.settings.arguments as Person;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Text(
                    personArgs.name.substring(0, 1),
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Adicionar foto ao perfil",
                ),
              ),
            ),
            PersonDetailsCard(
              title: "Nome:",
              value: personArgs.name,
            ),
            PersonDetailsCard(
              title: "Região:",
              value: personArgs.region,
            ),
            PersonDetailsCard(
              title: "Freq:",
              value: personArgs.freq,
            ),
            PersonDetailsCard(
              title: "Rank:",
              value: personArgs.rank,
            ),
            PersonDetailsCard(
              title: "Sexo:",
              value: personArgs.gender.isEmpty
                  ? "Não informado"
                  : personArgs.gender,
            ),
          ],
        ),
      ),
    );
  }
}

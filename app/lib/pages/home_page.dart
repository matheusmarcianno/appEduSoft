import 'package:app/blocs/person_bloc.dart';
import 'package:app/blocs/person_events.dart';
import 'package:app/blocs/person_state.dart';
import 'package:app/routes.dart';
import 'package:app/service/ibge_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IBGEService service = IBGEService();
  late final PersonBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = PersonBloc();
    bloc.add(LoadPersonEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pessoas"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: StreamBuilder<PersonState>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final personsList = snapshot.data?.persons ?? [];
            return ListView.separated(
              itemCount: personsList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  AppRoutes.PERSON_DETAILS,
                  arguments: personsList[index],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text(
                        personsList[index].name.substring(0, 1),
                      ),
                    ),
                  ),
                  title: Text(personsList[index].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.highlight_remove_sharp),
                    onPressed: () {
                      bloc.add(RemovePersonEvent(person: personsList[index]));
                    },
                  ),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          },
        ),
      ),
    );
  }
}

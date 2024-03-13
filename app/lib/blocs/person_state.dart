import 'package:app/models/person.dart';

abstract class PersonState {
  List<Person> persons;

  PersonState({
    required this.persons,
  });
}

class PersonInitialState extends PersonState {
  PersonInitialState() : super(persons: []);
}

class PersonSucessState extends PersonState {
  PersonSucessState({required List<Person> persons}) : super(persons: persons);
}

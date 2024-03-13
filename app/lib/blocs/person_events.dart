import 'package:app/models/person.dart';

abstract class PersonEvent {}

class LoadPersonEvent extends PersonEvent {}

class AddPersonEvent extends PersonEvent {
  Person person;

  AddPersonEvent({
    required this.person,
  });
}

class RemovePersonEvent extends PersonEvent {
  Person person;

  RemovePersonEvent({
    required this.person,
  });
}

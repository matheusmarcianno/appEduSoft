import 'package:app/blocs/person_events.dart';
import 'package:app/blocs/person_state.dart';
import 'package:app/repositories/persons_repository.dart';
import 'package:bloc/bloc.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final _personRepo = PersonsRepository();

  PersonBloc() : super(PersonInitialState()) {
    on<LoadPersonEvent>((event, emit) async =>
        emit(PersonSucessState(persons: await _personRepo.loadPersons())));

    on<RemovePersonEvent>((event, emit) => emit(
        PersonSucessState(persons: _personRepo.removePerson(event.person))));
  }
}

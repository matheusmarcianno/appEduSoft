import 'package:app/models/person.dart';
import 'package:app/service/ibge_service.dart';

class PersonsRepository {
  IBGEService service = IBGEService();
  List<Person> _persons = [];

  Future<List<Person>> loadPersons() async {
    List<Person> persons = await service.findAll();

    _persons = persons;

    return persons;
  }

  List<Person> removePerson(Person person) {
    _persons.removeWhere((value) => value.name == person.name);
    return _persons;
  }
}

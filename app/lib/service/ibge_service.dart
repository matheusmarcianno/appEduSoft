import 'dart:convert';
import 'package:app/models/person.dart';
import 'package:http/http.dart' as http;

class IBGEService {
  Future<List<Person>> findAll() async {
    List<Person> persons = [];
    var url = Uri.parse('https://servicodados.ibge.gov.br/api/v2/censos/nomes');
    var response = await http.get(url);
    var jsonResponse = jsonDecode(response.body) as List<dynamic>;
    persons = jsonResponse.map((json) => Person.fromJson(json)).toList();

    return persons;
  }
}

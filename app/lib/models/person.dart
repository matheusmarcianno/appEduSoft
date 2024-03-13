class Person {
  String name;
  double region;
  double freq;
  int rank;
  String gender;

  Person({
    required this.name,
    required this.region,
    required this.freq,
    required this.rank,
    required this.gender,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['nome'] ?? '',
      region: json['regiao'] != null ? json['regiao'].toDouble() : 0.0,
      freq: json['freq'] != null ? json['freq'].toDouble() : 0.0,
      rank: json['rank'] ?? 0,
      gender: json['sexo'] ?? '',
    );
  }
}

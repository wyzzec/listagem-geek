class PersonagemDto {
  String? name;
  String? gender;

  PersonagemDto({
    this.name,
    this.gender,
  });

  factory PersonagemDto.fromMap (Map<String, dynamic> map) {
    return PersonagemDto(
      name: map['name'],
      gender: map['gender'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "gender" : gender,
    };
  }
}
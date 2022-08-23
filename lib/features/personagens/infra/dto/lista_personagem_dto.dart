import 'package:listagem_geek/features/personagens/infra/dto/personagem_dto.dart';

class ListaPersonagemDto {
  final List<PersonagemDto>? personagens;

  const ListaPersonagemDto({
    this.personagens,
  });
  factory ListaPersonagemDto.fromMap(Map<String, dynamic> map) {
    return ListaPersonagemDto(
      personagens: map['results'] == null ? null : List<PersonagemDto>.from(map['results'].map((element) => PersonagemDto.fromMap(element))).toList(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "personagens": personagens,
    };
  }
}

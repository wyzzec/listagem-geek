import 'package:listagem_geek/features/personagens/domain/entities/personagem_entity.dart';
import 'package:listagem_geek/features/personagens/infra/dto/personagem_dto.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/i_personagem_mapper.dart';

class PersonagemMapperImpl extends IPersonagemMapper {
  @override
  PersonagemDto toPersonagemDto(PersonagemEntity personagemEntity) {
    return PersonagemDto(name: personagemEntity.nome, gender: personagemEntity.genero);
  }

  @override
  PersonagemEntity toPersonagemEntity(PersonagemDto personagemDto) {
    return PersonagemEntity(nome: personagemDto.name!, genero: personagemDto.gender!);
  }
}

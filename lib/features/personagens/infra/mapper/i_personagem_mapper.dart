import 'package:listagem_geek/features/personagens/domain/entities/personagem_entity.dart';
import 'package:listagem_geek/features/personagens/infra/dto/personagem_dto.dart';

abstract class IPersonagemMapper {
  PersonagemEntity toPersonagemEntity(PersonagemDto personagemDto);
  PersonagemDto toPersonagemDto(PersonagemEntity personagemEntity);
}
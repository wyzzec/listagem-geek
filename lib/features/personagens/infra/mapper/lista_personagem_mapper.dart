import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/entities/personagem_entity.dart';
import 'package:listagem_geek/features/personagens/infra/dto/lista_personagem_dto.dart';
import 'package:listagem_geek/features/personagens/infra/dto/personagem_dto.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/i_lista_personagem_mapper.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/i_personagem_mapper.dart';

class ListaPersonagemMapper extends IListaPersonagemMapper {
  final IPersonagemMapper iPersonagemMapper;
  @override
  ListaPersonagemDto toListaPersonagemDto(ListaPersonagemEntity listaPersonagemEntity) {
    return ListaPersonagemDto(
      personagens: List<PersonagemDto>.from(listaPersonagemEntity.personagens.map((e) => iPersonagemMapper.toPersonagemDto(e))).toList(),
    );
  }

  @override
  ListaPersonagemEntity toListaPersonagemEntity(ListaPersonagemDto listaPersonagemDto) {
    return ListaPersonagemEntity(
      personagens: List<PersonagemEntity>.from(listaPersonagemDto.personagens!.map((e) => iPersonagemMapper.toPersonagemEntity(e))).toList(),
    );
  }

  ListaPersonagemMapper({
    required this.iPersonagemMapper,
  });
}

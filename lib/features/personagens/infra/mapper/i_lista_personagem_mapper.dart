import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/infra/dto/lista_personagem_dto.dart';

abstract class IListaPersonagemMapper {
  ListaPersonagemEntity toListaPersonagemEntity (ListaPersonagemDto listaPersonagemDto);
  ListaPersonagemDto toListaPersonagemDto (ListaPersonagemEntity listaPersonagemEntity);
}
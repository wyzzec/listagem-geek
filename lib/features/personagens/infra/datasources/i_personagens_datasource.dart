import '../dto/lista_personagem_dto.dart';

abstract class IPersonagensDatasource {
  Future<ListaPersonagemDto> preencherLista();
}
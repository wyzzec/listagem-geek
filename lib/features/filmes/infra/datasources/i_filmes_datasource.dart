import 'package:listagem_geek/features/filmes/infra/dto/lista_filme_dto.dart';

abstract class IFilmesDatasource {
  Future<ListaFilmeDto> preencherLista();
}
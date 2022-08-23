import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/infra/dto/lista_filme_dto.dart';

abstract class IListaFilmeMapper {
  ListaFilmeEntity toListaFilmeEntity (ListaFilmeDto listaFilmeDto);
  ListaFilmeDto toListaFilmeDto (ListaFilmeEntity listaFilmeEntity);
}
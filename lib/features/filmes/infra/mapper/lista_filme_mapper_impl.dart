import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/infra/dto/filme_dto.dart';
import 'package:listagem_geek/features/filmes/infra/dto/lista_filme_dto.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/i_filme_mapper.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/i_lista_filme_mapper.dart';

class ListaFilmeMapperImpl implements IListaFilmeMapper {

  final IFilmeMapper iFilmeMapper;

  @override
  ListaFilmeDto toListaFilmeDto(ListaFilmeEntity listaFilmeEntity) {
    return ListaFilmeDto(filmes: List<FilmeDto>.from(listaFilmeEntity.filmes.map((element) => iFilmeMapper.toFilmeDto(element))).toList());
  }

  @override
  ListaFilmeEntity toListaFilmeEntity(ListaFilmeDto listaFilmeDto) {
    return ListaFilmeEntity(filmes: List<FilmeEntity>.from(listaFilmeDto.filmes!.map((element) => iFilmeMapper.toFilmeEntity(element))).toList());
  }

  const ListaFilmeMapperImpl({
    required this.iFilmeMapper,
  });
}
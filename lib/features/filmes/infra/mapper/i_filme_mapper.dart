import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/filmes/infra/dto/filme_dto.dart';

abstract class IFilmeMapper {
  FilmeEntity toFilmeEntity (FilmeDto filmeDto);
  FilmeDto toFilmeDto (FilmeEntity filmeEntity);
}
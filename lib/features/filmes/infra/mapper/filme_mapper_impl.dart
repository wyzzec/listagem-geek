import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/filmes/infra/dto/filme_dto.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/i_filme_mapper.dart';

class FilmeMapperImpl implements IFilmeMapper {
  @override
  FilmeDto toFilmeDto(FilmeEntity filmeEntity) {
    return FilmeDto(
        title: filmeEntity.titulo,
        episodeId: filmeEntity.idDoEpisodio,
        openingCrawl: filmeEntity.textoDeAbertura,
        director: filmeEntity.diretor,
        producer: filmeEntity.produtor,
        releaseDate: filmeEntity.dataDeLancamento);
  }

  @override
  FilmeEntity toFilmeEntity(FilmeDto filmeDto) {
    return FilmeEntity(
        titulo: filmeDto.title!,
        idDoEpisodio: filmeDto.episodeId!,
        textoDeAbertura: filmeDto.openingCrawl!,
        diretor: filmeDto.director!,
        produtor: filmeDto.producer!,
        dataDeLancamento: filmeDto.releaseDate!);
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/infra/datasources/i_filmes_datasource.dart';
import 'package:listagem_geek/features/filmes/infra/dto/filme_dto.dart';
import 'package:listagem_geek/features/filmes/infra/dto/lista_filme_dto.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/filme_mapper_impl.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/lista_filme_mapper_impl.dart';
import 'package:listagem_geek/features/filmes/infra/repositories/filmes_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class DatasourceMock extends Mock implements IFilmesDatasource {}

void main() {
  final DatasourceMock datasourceMock = DatasourceMock();
  final FilmeMapperImpl filmeMapperImpl = FilmeMapperImpl();
  final ListaFilmeMapperImpl listaFilmeMapperImpl = ListaFilmeMapperImpl(iFilmeMapper: filmeMapperImpl);
  final FilmesRepositoryImpl filmesRepositoryImpl = FilmesRepositoryImpl(iListaFilmeMapper: listaFilmeMapperImpl, iFilmesDatasource: datasourceMock);
  FilmeDto filmeDto1 =
      FilmeDto(title: 'a', episodeId: 1, openingCrawl: 'aaaaa', director: 'diretorA', producer: 'produtorA', releaseDate: '01/01/2000');
  FilmeDto filmeDto2 =
      FilmeDto(title: 'b', episodeId: 2, openingCrawl: 'bbbbb', director: 'diretorB', producer: 'produtorB', releaseDate: '02/02/2002');
  List<FilmeDto> filmes = [filmeDto1, filmeDto2];
  final ListaFilmeDto listaFilmeDto = ListaFilmeDto(filmes: filmes);

  test('deve retornar um ListaFilmeEntity', () async {
    when(() => datasourceMock.preencherLista()).thenAnswer((invocation) async => listaFilmeDto);
    final result = await filmesRepositoryImpl.preencherLista();
    expect(result, isA<Right>());
    expect(result.fold((l) => l, (r) => r), isA<ListaFilmeEntity>());
  });
}

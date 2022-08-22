import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/repositories/i_filmes_repository.dart';
import 'package:listagem_geek/features/filmes/domain/usecases/preencher_lista_de_filmes_usecase.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IFilmesRepository {}

main () {
  final RepositoryMock repositoryMock = RepositoryMock();
  final PreencherListaDeFilmesUsecase preencherListaDeFilmesUsecase = PreencherListaDeFilmesUsecase(iFilmesRepository: repositoryMock);
  final ListaDeFilmes listaDeFilmes = ListaDeFilmes(filmes: []);
  test('deve retornar uma lista de filmes', () async {
    when(() => repositoryMock.preencherLista()).thenAnswer((invocation) async => Right(listaDeFilmes));
    final response = await preencherListaDeFilmesUsecase();
    expect(response, isA<Right>());
    expect(response.fold((l) => l, (r) => r), isA<ListaDeFilmes>());

  });
}
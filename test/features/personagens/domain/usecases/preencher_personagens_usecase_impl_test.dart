import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/repositories/i_personagens_repository.dart';
import 'package:listagem_geek/features/personagens/domain/usecases/preencher_personagens_usecase_impl.dart';
import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IPersonagensRepository {}

void main () {

  final RepositoryMock repositoryMock = RepositoryMock();
  final PreencherPersonagensUsecaseImpl preencherPersonagensUsecaseImpl = PreencherPersonagensUsecaseImpl(iPersonagensRepository: repositoryMock);
  final ListaPersonagemEntity listaPersonagemEntity = ListaPersonagemEntity(personagens: []);

  test('deve retornar um objeto ListaPersonagemEntity', () async {
    when(() => repositoryMock.preencherLista()).thenAnswer((invocation) async => Right(listaPersonagemEntity));
    final response = await preencherPersonagensUsecaseImpl();
    expect(response.fold((l) => l, (r) => r), isA<ListaPersonagemEntity>());

  });
}
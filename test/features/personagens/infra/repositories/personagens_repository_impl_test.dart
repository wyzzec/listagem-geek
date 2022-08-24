import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/infra/datasources/i_personagens_datasource.dart';
import 'package:listagem_geek/features/personagens/infra/dto/lista_personagem_dto.dart';
import 'package:listagem_geek/features/personagens/infra/dto/personagem_dto.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/lista_personagem_mapper.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/personagem_mapper_impl.dart';
import 'package:listagem_geek/features/personagens/infra/repositories/personagens_repository_impl.dart';
import 'package:mocktail/mocktail.dart';


class DatasourceMock extends Mock implements IPersonagensDatasource {}

void main () {
  final DatasourceMock datasourceMock = DatasourceMock();
  final PersonagemMapperImpl personagemMapperImpl = PersonagemMapperImpl();
  final ListaPersonagemMapper listaPersonagemMapper = ListaPersonagemMapper(iPersonagemMapper: personagemMapperImpl);
  final PersonagensRepositoryImpl personagensRepositoryImpl = PersonagensRepositoryImpl(iListaPersonagemMapper: listaPersonagemMapper, iPersonagensDatasource: datasourceMock);

  PersonagemDto personagemDto1 = PersonagemDto(name: 'nome1', gender: 'gender1');
  PersonagemDto personagemDto2 = PersonagemDto(name: 'nome2', gender: 'gender2');
  List<PersonagemDto> personagens = [personagemDto1, personagemDto2];
  final ListaPersonagemDto listaPersonagemDto = ListaPersonagemDto(personagens: personagens);

  test('deve retornar um objeto ListaPersonagemEntity', () async {
    when(() => datasourceMock.preencherLista()).thenAnswer((invocation) async => listaPersonagemDto);
  final result = await personagensRepositoryImpl.preencherLista();
  expect(result, isA<Right>());
  expect(result.fold((l) => l, (r) => r), isA<ListaPersonagemEntity>());
  });
}
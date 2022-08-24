
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/usecases/i_preencher_personagens_usecase.dart';
import 'package:listagem_geek/features/personagens/presenter/bloc/personagens_bloc.dart';
import 'package:mocktail/mocktail.dart';

class UsecaseMock extends Mock implements IPreencherPersonagensUsecase {}

void main () {
  final usecaseMock = UsecaseMock();

  test('deve retornar um state sucess carregando o objeto ListaFilmesEntity', () async {
    PersonagensBloc personagensBloc = PersonagensBloc(iPreencherPersonagensUsecase: usecaseMock);
    when(() => usecaseMock()).thenAnswer((invocation) async => Right(ListaPersonagemEntity(personagens: [])));
    expect(personagensBloc.state, isA<PersonagensInitial>());
    personagensBloc.add(PreencherPersonagensEvent());
    await Future.delayed(const Duration(seconds: 0));
    expect(personagensBloc.state, isA<PersonagensSucess>());
    personagensBloc.close();
  });
}
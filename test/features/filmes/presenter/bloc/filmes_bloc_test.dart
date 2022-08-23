import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/usecases/i_preencher_lista_de_filmes_usecase.dart';
import 'package:listagem_geek/features/filmes/presenter/bloc/filmes_bloc.dart';
import 'package:mocktail/mocktail.dart';

class UsecaseMock extends Mock implements IPreencherListaDeFilmesUsecase {}

void main() {
  final usecaseMock = UsecaseMock();

  test('deve retornar um state sucess carregando o objeto ListaFilmesEntity', () async {
    FilmesBloc filmesBloc = FilmesBloc(iPreencherListaDeFilmesUsecase: usecaseMock);
    when(() => usecaseMock.call()).thenAnswer((_) async => Right(ListaFilmeEntity(filmes: [])));
    expect(filmesBloc.state, isA<FilmesInitial>());
    filmesBloc.add(PreencherListaFilmesEvent());
    await Future.delayed(const Duration(seconds: 0));
    expect(filmesBloc.state, isA<FilmesSucess>());
    filmesBloc.close();
  });
}

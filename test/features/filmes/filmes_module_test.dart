import 'dart:convert';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/usecases/i_preencher_lista_de_filmes_usecase.dart';
import 'package:listagem_geek/features/filmes/filmes_module.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';

import 'filmes_map.dart';


class FakeUri extends Fake implements Uri {}
class HttpMock extends Mock implements http.Client {}

void main () {
  setUpAll(() {
    registerFallbackValue(FakeUri());
  });
  final HttpMock httpMock = HttpMock();
  initModule(FilmesModule(), replaceBinds: [
    Bind.instance<http.Client>(httpMock),
  ]);
  FilmesMap filmesMap = FilmesMap();
  test('deve retornar um objeto ListaFilmesEntity', () async {
    final httpResponse200 = http.Response(jsonEncode(filmesMap.map), 200);
    when(() => httpMock.get(any())).thenAnswer((invocation) async => httpResponse200);
    final usecase = Modular.get<IPreencherListaDeFilmesUsecase>();
    final result = await usecase();
    expect(result, isA<dartz.Right>());
    expect(result.fold((l) => l, (r) => r), isA<ListaFilmeEntity>());
  });
}
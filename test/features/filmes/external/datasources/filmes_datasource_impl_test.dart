import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:listagem_geek/features/filmes/external/datasources/filmes_datasource_impl.dart';
import 'package:listagem_geek/features/filmes/infra/dto/lista_filme_dto.dart';
import 'package:mocktail/mocktail.dart';

import '../../filmes_map.dart';

class HttpMock extends Mock implements http.Client {}
class FakeUri extends Fake implements Uri {}
void main () {
  setUpAll(() {
    registerFallbackValue(FakeUri());
  });
  FilmesMap filmesMap = FilmesMap();
  final httpMock = HttpMock();
  final datasource = FilmesDatasourceImpl(httpClient: httpMock);
  final httpResponse200 = http.Response(jsonEncode(filmesMap.map), 200);
  test('deve retornar um objeto ListaFilmeDto', () async {
    when(() => httpMock.get(any())).thenAnswer((invocation) async => httpResponse200);
    final result = await datasource.preencherLista();
    expect(result, isA<ListaFilmeDto>());

  });
}
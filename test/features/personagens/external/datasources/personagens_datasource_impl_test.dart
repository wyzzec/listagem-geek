import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/personagens/external/datasources/personagens_datasource_impl.dart';
import 'package:listagem_geek/features/personagens/infra/dto/lista_personagem_dto.dart';
import 'dart:convert';
import 'package:mocktail/mocktail.dart';

import '../../personagens_map.dart';

class HttpMock extends Mock implements http.Client {}
class FakeUri extends Fake implements Uri {}

void main () {
  setUpAll(() {
    registerFallbackValue(FakeUri());
  });
  PersonagensMap personagensMap = PersonagensMap();
  final httpMock = HttpMock();
  final datasource = PersonagensDatasourceImpl(httpClient: httpMock);
  final httpResponse200 = http.Response(jsonEncode(personagensMap.map), 200);
  test('deve retornar um objeto ListaPersonagemDto', () async {
    when(() => httpMock.get(any())).thenAnswer((invocation) async => httpResponse200);
    final result = await datasource.preencherLista();
    expect(result, isA<ListaPersonagemDto>());
  });
}
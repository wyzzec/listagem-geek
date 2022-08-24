import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:listagem_geek/app_module.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/usecases/i_preencher_personagens_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';

import 'personagens_map.dart';

class FakeUri extends Fake implements Uri {}
class HttpMock extends Mock implements http.Client {}

void main () {
  setUpAll(() {
    registerFallbackValue(FakeUri());
  });
  final HttpMock httpMock = HttpMock();
  initModule(AppModule(), replaceBinds: [
    Bind.instance<http.Client>(httpMock),
  ]);
  PersonagensMap personagensMap = PersonagensMap();
  test('Deve retornar um objeto ListaPersonagemEntity', () async {
    final httpResponse200 = http.Response(jsonEncode(personagensMap.map), 200);
    when(() => httpMock.get(any())).thenAnswer((invocation) async => httpResponse200);
    final usecase = Modular.get<IPreencherPersonagensUsecase>();
    final result = await usecase();
    expect(result.fold((l) => l, (r) => r), isA<ListaPersonagemEntity>());
  });
}
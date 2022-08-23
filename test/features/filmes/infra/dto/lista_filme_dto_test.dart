import 'package:flutter_test/flutter_test.dart';
import 'package:listagem_geek/features/filmes/infra/dto/lista_filme_dto.dart';

import '../../filmes_map.dart';

void main () {
  FilmesMap filmesMap = FilmesMap();
  test('metodo fromMap deve retornar um objeto ListaFilmeDto', () async {
    final ListaFilmeDto listaFilmeDto = ListaFilmeDto.fromMap(filmesMap.map);
    expect(listaFilmeDto, isA<ListaFilmeDto>());
  });
}
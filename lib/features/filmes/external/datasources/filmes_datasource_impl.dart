import 'dart:convert';

import 'package:listagem_geek/features/filmes/domain/errors/filmes_datasource_error.dart';
import 'package:listagem_geek/features/filmes/infra/datasources/i_filmes_datasource.dart';
import 'package:listagem_geek/features/filmes/infra/dto/lista_filme_dto.dart';
import 'package:http/http.dart' as http;

class FilmesDatasourceImpl implements IFilmesDatasource {
  final http.Client httpClient;
  final String _urlBase = 'https://swapi.dev/api';
  final String _urlEndPoint = '/films';

  @override
  Future<ListaFilmeDto> preencherLista() async {
    final http.Response response = await httpClient.get(Uri.parse(_urlBase + _urlEndPoint));
    if (response.statusCode == 200) {
      final ListaFilmeDto listaFilmeDto = ListaFilmeDto.fromMap(jsonDecode(response.body));
      return listaFilmeDto;
    } else {
      throw FilmesDatasourceError(message: 'Erro datasource filmes. statuscode: ${response.statusCode}');
    }
  }

  const FilmesDatasourceImpl({
    required this.httpClient,
  });
}
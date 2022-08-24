import 'package:listagem_geek/features/personagens/domain/errors/personagens_datasource_error.dart';
import 'package:listagem_geek/features/personagens/infra/datasources/i_personagens_datasource.dart';
import 'package:listagem_geek/features/personagens/infra/dto/lista_personagem_dto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonagensDatasourceImpl implements IPersonagensDatasource {
  final http.Client httpClient;
  final String _urlBase = 'https://swapi.dev/api';
  final String _urlEndPoint = '/people';
  @override
  Future<ListaPersonagemDto> preencherLista() async {
    final http.Response response = await httpClient.get(Uri.parse(_urlBase + _urlEndPoint));
    if (response.statusCode == 200){
      final ListaPersonagemDto listaPersonagemDto = ListaPersonagemDto.fromMap(jsonDecode(response.body));
      return listaPersonagemDto;
    } else {
      throw PersonagensDatasourceError(message: 'Erro datasource personagens. statusCode: ${response.statusCode}');
    }
  }

  const PersonagensDatasourceImpl({
    required this.httpClient,
  });
}
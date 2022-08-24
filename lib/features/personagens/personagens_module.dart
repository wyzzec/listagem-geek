import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:listagem_geek/features/personagens/domain/usecases/preencher_personagens_usecase_impl.dart';
import 'package:listagem_geek/features/personagens/external/datasources/personagens_datasource_impl.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/lista_personagem_mapper.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/personagem_mapper_impl.dart';
import 'package:listagem_geek/features/personagens/infra/repositories/personagens_repository_impl.dart';
import 'package:listagem_geek/features/personagens/presenter/bloc/personagens_bloc.dart';

class PersonagensModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => PersonagensBloc(iPreencherPersonagensUsecase: i()), export: true),
    Bind<http.Client>((i) => http.Client(),export: true),
    Bind((i) => PersonagensDatasourceImpl(httpClient: i()), export: true),
    Bind((i) => PersonagemMapperImpl(), export: true),
    Bind((i) => ListaPersonagemMapper(iPersonagemMapper: i(),), export: true),
    Bind((i) => PersonagensRepositoryImpl(iListaPersonagemMapper: i(), iPersonagensDatasource: i()), export: true),
    Bind((i) => PreencherPersonagensUsecaseImpl(iPersonagensRepository: i()), export: true)
  ];
}
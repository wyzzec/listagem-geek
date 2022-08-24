import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:listagem_geek/features/filmes/domain/usecases/preencher_lista_de_filmes_usecase.dart';
import 'package:listagem_geek/features/filmes/external/datasources/filmes_datasource_impl.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/filme_mapper_impl.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/lista_filme_mapper_impl.dart';
import 'package:listagem_geek/features/filmes/presenter/bloc/filmes_bloc.dart';

import 'infra/repositories/filmes_repository_impl.dart';
class FilmesModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.singleton<FilmesBloc>((i) => FilmesBloc(iPreencherListaDeFilmesUsecase: i()), export: true),
    Bind<http.Client>((i) => http.Client(),export: true),
    Bind((i) => FilmesDatasourceImpl(httpClient: i()), export: true),
    Bind((i) => FilmeMapperImpl(), export: true),
    Bind((i) => ListaFilmeMapperImpl(iFilmeMapper: i()), export: true),
    Bind((i) => FilmesRepositoryImpl(iListaFilmeMapper: i(), iFilmesDatasource: i()), export: true),
    Bind((i) => PreencherListaDeFilmesUsecase(iFilmesRepository: i()), export: true),
  ];
}
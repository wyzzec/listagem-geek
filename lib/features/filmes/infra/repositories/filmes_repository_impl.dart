import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/errors/filmes_datasource_error.dart';
import 'package:listagem_geek/features/filmes/domain/errors/filmes_repository_error.dart';
import 'package:listagem_geek/features/filmes/domain/errors/i_filmes_error.dart';
import 'package:listagem_geek/features/filmes/domain/repositories/i_filmes_repository.dart';
import 'package:listagem_geek/features/filmes/infra/datasources/i_filmes_datasource.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/i_lista_filme_mapper.dart';

class FilmesRepositoryImpl implements IFilmesRepository {

  final IListaFilmeMapper iListaFilmeMapper;
  final IFilmesDatasource iFilmesDatasource;

  @override
  Future<Either<IFilmesError, ListaFilmeEntity>> preencherLista() async {
    try {
      final result = await iFilmesDatasource.preencherLista();
      return Right(iListaFilmeMapper.toListaFilmeEntity(result));
    } on FilmesDatasourceError catch (e, s) {
      if (kDebugMode) {
        print('message: $e \n'
            'stackTrace: $s');
      }
      return Left(FilmesDatasourceError(message: e.message, stackTrace: s));
    }
    catch (e, s){
      if (kDebugMode) {
        print('message: $e \n'
            'stackTrace: $s');
      }
      return Left(FilmesRepositoryError(message: e.toString(), stackTrace: s));
    }
  }

  const FilmesRepositoryImpl({
    required this.iListaFilmeMapper,
    required this.iFilmesDatasource,
  });
}
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';
import 'package:listagem_geek/features/personagens/domain/errors/personagens_datasource_error.dart';
import 'package:listagem_geek/features/personagens/domain/errors/personagens_repository_error.dart';
import 'package:listagem_geek/features/personagens/domain/repositories/i_personagens_repository.dart';
import 'package:listagem_geek/features/personagens/infra/datasources/i_personagens_datasource.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/i_lista_personagem_mapper.dart';

class PersonagensRepositoryImpl extends IPersonagensRepository {
  final IListaPersonagemMapper iListaPersonagemMapper;
  final IPersonagensDatasource iPersonagensDatasource;

  @override
  Future<Either<IPersonagensError, ListaPersonagemEntity>> preencherLista() async {
    try {
      final result = await iPersonagensDatasource.preencherLista();
      return Right(iListaPersonagemMapper.toListaPersonagemEntity(result));
    } on PersonagensDatasourceError catch (e, s) {
      if (kDebugMode) {
        print('message: ${e.message} \n'
            'stackTrace: $s');
      }
      return Left(PersonagensDatasourceError(message: e.message, stackTrace: s));
    } catch (e, s) {
      if (kDebugMode) {
        print('message: $e \n'
            'stackTrace: $s');
      }
      return Left(PersonagensRepositoryError(message: e.toString(), stackTrace: s));
    }
  }

  PersonagensRepositoryImpl({
    required this.iListaPersonagemMapper,
    required this.iPersonagensDatasource,
  });
}

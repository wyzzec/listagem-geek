import 'package:dartz/dartz.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';

abstract class IPersonagensRepository {
  Future<Either<IPersonagensError, ListaPersonagemEntity>> preencherLista();
}
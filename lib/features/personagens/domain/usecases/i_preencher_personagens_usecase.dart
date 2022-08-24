import 'package:dartz/dartz.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';

abstract class IPreencherPersonagensUsecase {
  Future<Either<IPersonagensError, ListaPersonagemEntity>> call();
}
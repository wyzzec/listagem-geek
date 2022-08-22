import 'package:dartz/dartz.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/errors/i_filmes_error.dart';

abstract class IPreencherListaDeFilmesUsecase {
  Future<Either<IFilmesError, ListaDeFilmes>> call();
}
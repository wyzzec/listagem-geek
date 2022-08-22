import 'package:dartz/dartz.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/errors/i_filmes_error.dart';
import 'package:listagem_geek/features/filmes/domain/repositories/i_filmes_repository.dart';
import 'package:listagem_geek/features/filmes/domain/usecases/i_preencher_lista_de_filmes_usecase.dart';

class PreencherListaDeFilmesUsecase implements IPreencherListaDeFilmesUsecase {
  final IFilmesRepository _iFilmesRepository;

  @override
  Future<Either<IFilmesError, ListaDeFilmes>> call() async {
    return await _iFilmesRepository.preencherLista();
  }

  const PreencherListaDeFilmesUsecase({
    required IFilmesRepository iFilmesRepository,
  }) : _iFilmesRepository = iFilmesRepository;
}
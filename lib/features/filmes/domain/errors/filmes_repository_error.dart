import 'package:listagem_geek/features/filmes/domain/errors/i_filmes_error.dart';

class FilmesRepositoryError extends IFilmesError {
  FilmesRepositoryError({required super.message, super.stackTrace});
}
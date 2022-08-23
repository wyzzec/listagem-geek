import 'package:listagem_geek/features/filmes/domain/errors/i_filmes_error.dart';

class FilmesUsecaseError extends IFilmesError {
  FilmesUsecaseError({required super.message, super.stackTrace});
}
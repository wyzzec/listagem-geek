import 'package:listagem_geek/features/filmes/domain/errors/i_filmes_error.dart';

class FilmesDatasourceError extends IFilmesError {
  FilmesDatasourceError({required super.message, super.stackTrace});
}
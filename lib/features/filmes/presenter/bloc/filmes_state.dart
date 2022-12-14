part of 'filmes_bloc.dart';

@immutable
abstract class FilmesState {}

class FilmesInitial extends FilmesState {}
class FilmesSucess extends FilmesState {
  final ListaFilmeEntity listaFilmeEntity;
  FilmesSucess({
    required this.listaFilmeEntity,
  });
}
class FilmesError extends FilmesState{
  final IFilmesError iFilmesError;

  FilmesError({
    required this.iFilmesError,
  });
}
class FilmesLoading extends FilmesState {}


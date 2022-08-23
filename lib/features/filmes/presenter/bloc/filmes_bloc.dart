import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';
import 'package:listagem_geek/features/filmes/domain/entities/lista_filme_entity.dart';
import 'package:listagem_geek/features/filmes/domain/errors/i_filmes_error.dart';
import '../../domain/usecases/i_preencher_lista_de_filmes_usecase.dart';
part 'filmes_event.dart';
part 'filmes_state.dart';

class FilmesBloc extends Bloc<FilmesEvent, FilmesState> {
  final IPreencherListaDeFilmesUsecase iPreencherListaDeFilmesUsecase;
  FilmesBloc({required this.iPreencherListaDeFilmesUsecase}) : super(FilmesInitial()) {
    on<PreencherListaFilmesEvent>((event, emit) async {
      emit(FilmesLoading());
      final result = await iPreencherListaDeFilmesUsecase();
      result.fold(
              (l) => emit(FilmesError(iFilmesError: l)),
              (r) => emit(FilmesSucess(listaFilmeEntity: r)));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/favoritos/domain/entities/lista_favoritos_entity.dart';
import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/personagens/domain/entities/personagem_entity.dart';
import 'package:meta/meta.dart';

import '../../infra/repositories/favoritos_repository.dart';

part 'favoritos_event.dart';
part 'favoritos_state.dart';

class FavoritosBloc extends Bloc<FavoritosEvent, FavoritosState> {


  final FavoritosRepository favoritosRepository = Modular.get<FavoritosRepository>();

  FavoritosBloc() : super(FavoritosInitial()) {
    on<FavoritosEventAdicionar>((event, emit) {
      if (event.filmeOuPersonagem is FilmeEntity){
        var filmeEntity = event.filmeOuPersonagem as FilmeEntity;
        if (!favoritosRepository.listaFavoritosEntity.favoritos.contains(filmeEntity)){
          favoritosRepository.setListaFavoritosEntity(filmeEntity);
          emit(FavoritosLoaded(listaFavoritosEntity: favoritosRepository.listaFavoritosEntity));
        }
      }
      if (event.filmeOuPersonagem is PersonagemEntity){
        var personagemEntity = event.filmeOuPersonagem as PersonagemEntity;
        if(!favoritosRepository.listaFavoritosEntity.favoritos.contains(personagemEntity)){
          favoritosRepository.setListaFavoritosEntity(personagemEntity);
          emit(FavoritosLoaded(listaFavoritosEntity: favoritosRepository.listaFavoritosEntity));
        }
      }
    });
    on<FavoritosEventRemover>((event, emit) {
      favoritosRepository.deletarItem(event.filmeOuPersonagem);
      emit(FavoritosLoaded(listaFavoritosEntity: favoritosRepository.listaFavoritosEntity));
    });
    on<FavoritosEventCarregarDatabase>((event, emit) {
      emit(FavoritosLoaded(listaFavoritosEntity: favoritosRepository.listaFavoritosEntity));
    });

  }
}

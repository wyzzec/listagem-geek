import 'package:bloc/bloc.dart';
import 'package:listagem_geek/features/favoritos/domain/entities/lista_favoritos_entity.dart';
import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/personagens/domain/entities/personagem_entity.dart';
import 'package:meta/meta.dart';

part 'favoritos_event.dart';
part 'favoritos_state.dart';

class FavoritosBloc extends Bloc<FavoritosEvent, FavoritosState> {

  ListaFavoritosEntity listaFavoritosEntity = ListaFavoritosEntity(favoritos: []);


  FavoritosBloc() : super(FavoritosInitial()) {
    on<FavoritosEventAdicionar>((event, emit) {
      if (event.filmeOuPersonagem is FilmeEntity){
        var filmeEntity = event.filmeOuPersonagem as FilmeEntity;
        if (!listaFavoritosEntity.favoritos.contains(filmeEntity)){
          listaFavoritosEntity.favoritos.add(event.filmeOuPersonagem);
          emit(FavoritosLoaded(listaFavoritosEntity: listaFavoritosEntity));
        }
      }
      if (event.filmeOuPersonagem is PersonagemEntity){
        var personagemEntity = event.filmeOuPersonagem as PersonagemEntity;
        if(!listaFavoritosEntity.favoritos.contains(personagemEntity)){
          listaFavoritosEntity.favoritos.add(event.filmeOuPersonagem);
          emit(FavoritosLoaded(listaFavoritosEntity: listaFavoritosEntity));
        }
      }
    });
    on<FavoritosEventRemover>((event, emit) {
      listaFavoritosEntity.favoritos.remove(event.filmeOuPersonagem);
      emit(FavoritosLoaded(listaFavoritosEntity: listaFavoritosEntity));
    });
    on<FavoritosEventEsvaziarLista>((event, emit) {
      listaFavoritosEntity.favoritos.clear();
      emit(FavoritosInitial());
    });

  }
}

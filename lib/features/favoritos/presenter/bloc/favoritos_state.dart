part of 'favoritos_bloc.dart';

@immutable
abstract class FavoritosState {}

class FavoritosInitial extends FavoritosState {}
class FavoritosLoaded  extends FavoritosState{
  ListaFavoritosEntity listaFavoritosEntity;

  FavoritosLoaded({
    required this.listaFavoritosEntity,
  });
}

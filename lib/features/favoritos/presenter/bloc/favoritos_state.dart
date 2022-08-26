part of 'favoritos_bloc.dart';

@immutable
abstract class FavoritosState {}

class FavoritosInitial extends FavoritosState {}
class FavoritosLoaded  extends FavoritosState{
  final ListaFavoritosEntity listaFavoritosEntity;

  FavoritosLoaded({
    required this.listaFavoritosEntity,
  });
}

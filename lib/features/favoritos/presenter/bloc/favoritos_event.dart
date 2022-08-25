part of 'favoritos_bloc.dart';

@immutable
abstract class FavoritosEvent {}

class FavoritosEventAdicionar extends FavoritosEvent {
  Object filmeOuPersonagem;

  FavoritosEventAdicionar({
    required this.filmeOuPersonagem,
  });
}
class FavoritosEventRemover extends FavoritosEvent {
  Object filmeOuPersonagem;

  FavoritosEventRemover({
    required this.filmeOuPersonagem,
  });
}

class FavoritosEventEsvaziarLista extends FavoritosEvent {}

class FavoritosEventCarregarDatabase extends FavoritosEvent {}
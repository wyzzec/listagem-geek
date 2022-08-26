part of 'favoritos_bloc.dart';

@immutable
abstract class FavoritosEvent {}

class FavoritosEventAdicionar extends FavoritosEvent {
  final Object filmeOuPersonagem;

  FavoritosEventAdicionar({
    required this.filmeOuPersonagem,
  });
}
class FavoritosEventRemover extends FavoritosEvent {
  final Object filmeOuPersonagem;

  FavoritosEventRemover({
    required this.filmeOuPersonagem,
  });
}

class FavoritosEventEsvaziarLista extends FavoritosEvent {}

class FavoritosEventCarregarDatabase extends FavoritosEvent {}
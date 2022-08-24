part of 'personagens_bloc.dart';

@immutable
abstract class PersonagensState {}

class PersonagensInitial extends PersonagensState {}
class PersonagensSucess extends PersonagensState {
  ListaPersonagemEntity listaPersonagemEntity;

  PersonagensSucess({
    required this.listaPersonagemEntity,
  });
}
class PersonagensLoading extends PersonagensState {}
class PersonagensError extends PersonagensState {
  IPersonagensError iPersonagensError;

  PersonagensError({
    required this.iPersonagensError,
  });
}

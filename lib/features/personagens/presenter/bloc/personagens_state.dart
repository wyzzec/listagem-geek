part of 'personagens_bloc.dart';

@immutable
abstract class PersonagensState {}

class PersonagensInitial extends PersonagensState {}
class PersonagensSucess extends PersonagensState {
  final ListaPersonagemEntity listaPersonagemEntity;

  PersonagensSucess({
    required this.listaPersonagemEntity,
  });
}
class PersonagensLoading extends PersonagensState {}
class PersonagensError extends PersonagensState {
  final IPersonagensError iPersonagensError;

  PersonagensError({
    required this.iPersonagensError,
  });
}

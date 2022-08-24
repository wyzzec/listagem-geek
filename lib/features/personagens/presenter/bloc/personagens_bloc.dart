import 'package:bloc/bloc.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';
import 'package:listagem_geek/features/personagens/domain/usecases/i_preencher_personagens_usecase.dart';
import 'package:meta/meta.dart';


part 'personagens_event.dart';
part 'personagens_state.dart';

class PersonagensBloc extends Bloc<PersonagensEvent, PersonagensState> {
  final IPreencherPersonagensUsecase iPreencherPersonagensUsecase;
  PersonagensBloc({required this.iPreencherPersonagensUsecase}) : super(PersonagensInitial()) {
    on<PreencherPersonagensEvent>((event, emit) async {
      emit(PersonagensLoading());
      final result = await iPreencherPersonagensUsecase();
      result.fold(
              (l) => emit(PersonagensError(iPersonagensError: l)),
              (r) => emit(PersonagensSucess(listaPersonagemEntity: r)));
    });
  }
}
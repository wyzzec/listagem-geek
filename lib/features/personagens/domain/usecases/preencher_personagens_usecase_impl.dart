import 'package:dartz/dartz.dart';
import 'package:listagem_geek/features/personagens/domain/entities/lista_personagem_entity.dart';
import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';
import 'package:listagem_geek/features/personagens/domain/repositories/i_personagens_repository.dart';
import 'package:listagem_geek/features/personagens/domain/usecases/i_preencher_personagens_usecase.dart';

class PreencherPersonagensUsecaseImpl extends IPreencherPersonagensUsecase {
  final IPersonagensRepository iPersonagensRepository;

  @override
  Future<Either<IPersonagensError, ListaPersonagemEntity>> call() async {
    return await iPersonagensRepository.preencherLista();
  }

  PreencherPersonagensUsecaseImpl({
    required this.iPersonagensRepository,
  });
}

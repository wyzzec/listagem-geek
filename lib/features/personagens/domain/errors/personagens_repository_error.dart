import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';

class PersonagensRepositoryError extends IPersonagensError {
  PersonagensRepositoryError({super.message, super.stackTrace});
}
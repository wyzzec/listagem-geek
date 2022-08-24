import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';

class PersonagensUsecaseError extends IPersonagensError {
  PersonagensUsecaseError({super.message, super.stackTrace});
}
import 'package:listagem_geek/features/personagens/domain/errors/i_personagens_error.dart';

class PersonagensDatasourceError extends IPersonagensError {
  PersonagensDatasourceError({super.message, super.stackTrace});
}
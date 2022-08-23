import 'package:listagem_geek/features/filmes/infra/dto/filme_dto.dart';

class ListaFilmeDto {
  final List<FilmeDto>? filmes;

  const ListaFilmeDto({
    required this.filmes,
  });

  factory ListaFilmeDto.fromMap(Map<String, dynamic> map) {
    return ListaFilmeDto(
      filmes: map['results'] == null ? null : List<FilmeDto>.from(map['results'].map((element) => FilmeDto.fromMap(element))).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "filmes": filmes,
    };
  }
}
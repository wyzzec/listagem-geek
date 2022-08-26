import 'package:listagem_geek/features/favoritos/domain/entities/lista_favoritos_entity.dart';
import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/filmes/infra/dto/filme_dto.dart';
import 'package:listagem_geek/features/filmes/infra/mapper/filme_mapper_impl.dart';
import 'package:listagem_geek/features/personagens/domain/entities/personagem_entity.dart';
import 'package:listagem_geek/features/personagens/infra/mapper/personagem_mapper_impl.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../global/external/database/db.dart';
import '../../../personagens/infra/dto/personagem_dto.dart';

class FavoritosRepository {
  late Database? db;
  final ListaFavoritosEntity _listaFavoritosEntity = ListaFavoritosEntity(favoritos: []);
  final FilmeMapperImpl filmeMapperImpl = FilmeMapperImpl();
  PersonagemMapperImpl personagemMapperImpl = PersonagemMapperImpl();

  ListaFavoritosEntity get listaFavoritosEntity => _listaFavoritosEntity;

  FavoritosRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getListaFavoritosEntity();
  }

  _getListaFavoritosEntity() async {
    db = await DB.instance.database;
    List filmes = await db!.query('favoritos_filme');
    var listaFilmes = List.from(filmes.map((e) => filmeMapperImpl.toFilmeEntity(FilmeDto.fromMap(e))));
    for (FilmeEntity filmeEntity in listaFilmes) {
      _listaFavoritosEntity.favoritos.add(filmeEntity);
    }
    List personagens = await db!.query('favoritos_personagem');
    var listaPersonagens = List.from(personagens.map((e) => personagemMapperImpl.toPersonagemEntity(PersonagemDto.fromMap(e))));
    for (PersonagemEntity personagemEntity in listaPersonagens) {
      _listaFavoritosEntity.favoritos.add(personagemEntity);
    }
  }

  setListaFavoritosEntity(Object object) async {
    db = await DB.instance.database;
    if (object is FilmeEntity) {
      db!.insert('favoritos_filme', {
        'episode_id': object.idDoEpisodio,
        'title': object.titulo,
        'opening_crawl': object.textoDeAbertura,
        'director': object.diretor,
        'producer': object.produtor,
        'release_date': object.dataDeLancamento,
      });
    }
    if (object is PersonagemEntity) {
      db!.insert('favoritos_personagem', {
        'name': object.nome,
        'gender': object.genero,
      });
    }
    _listaFavoritosEntity.favoritos.add(object);
  }
  deletarDatabase() async {
    db = null;
    db = await DB.instance.deletarDatabase;

  }
  deletarItem(Object object) async {
    _listaFavoritosEntity.favoritos.remove(object);
    db = await DB.instance.database;
    if (object is FilmeEntity) {
      return await db!.delete('favoritos_filme', where: 'episode_id = ?', whereArgs: [object.idDoEpisodio]);
    }
    if (object is PersonagemEntity) {
      return await db!.delete('favoritos_personagem', where: 'name = ?', whereArgs: [object.nome]);
    }
  }
}

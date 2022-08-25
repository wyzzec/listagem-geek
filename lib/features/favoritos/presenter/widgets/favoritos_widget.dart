import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/favoritos/presenter/bloc/favoritos_bloc.dart';
import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/personagens/domain/entities/personagem_entity.dart';

class FavoritosWidget extends StatefulWidget {
  FavoritosWidget({Key? key}) : super(key: key);
  final FavoritosBloc favoritosBloc = Modular.get<FavoritosBloc>();
  @override
  State<FavoritosWidget> createState() => _FavoritosWidgetState();
}
class _FavoritosWidgetState extends State<FavoritosWidget> {
@override
  void initState() {
    super.initState();
    widget.favoritosBloc.add(FavoritosEventCarregarDatabase());
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer(
        bloc: widget.favoritosBloc,
        builder: (context, state) {
          Color iconColor = Colors.black;
          if (state is FavoritosLoaded) {
            return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) { return const Divider(thickness: 2, color: Colors.white,);},
                addAutomaticKeepAlives: true,

                itemCount: state.listaFavoritosEntity.favoritos.length,
                itemBuilder: (context, index) {
                  String listTileTitle = '';
                  if (state.listaFavoritosEntity.favoritos[index] is FilmeEntity) {
                    var filmeEntity = state.listaFavoritosEntity.favoritos[index] as FilmeEntity;
                    listTileTitle = filmeEntity.titulo;
                    iconColor = Colors.red;
                  }
                  if (state.listaFavoritosEntity.favoritos[index] is PersonagemEntity) {
                    var personagemEntity = state.listaFavoritosEntity.favoritos[index] as PersonagemEntity;
                    listTileTitle = personagemEntity.nome;
                    iconColor = Colors.green;
                  }
                  return Card(

                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: iconColor),
                      ),
                      title: Text(listTileTitle),
                      trailing: IconButton(
                          onPressed: () {
                            widget.favoritosBloc.add(FavoritosEventRemover(filmeOuPersonagem: state.listaFavoritosEntity.favoritos[index]));
                          },
                          icon: const Icon(Icons.remove_circle_outline)),
                    ),
                  );
                });
          }
            if (state is FavoritosInitial) {
              return const Text('Sem favoritos para mostrar');
            }
            return Container(color: Colors.grey,);
        },
        listener: (context, state) {},
      ),
    );
  }
}

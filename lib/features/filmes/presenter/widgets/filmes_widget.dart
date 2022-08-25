import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/favoritos/presenter/bloc/favoritos_bloc.dart';
import 'package:listagem_geek/features/filmes/domain/entities/filme_entity.dart';
import 'package:listagem_geek/features/filmes/presenter/bloc/filmes_bloc.dart';

import '../../../../global/presenter/widgets/erro_no_servidor_popup_widget.dart';

class FilmesWidget extends StatefulWidget {
  FilmesWidget({Key? key}) : super(key: key);
  final FilmesBloc filmesBloc = Modular.get<FilmesBloc>();
  final FavoritosBloc favoritosBloc = Modular.get<FavoritosBloc>();
  @override
  State<FilmesWidget> createState() => _FilmesWidgetState();
}

class _FilmesWidgetState extends State<FilmesWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder(
        bloc: Modular.get<FavoritosBloc>(),
        builder: (context, state) {
          return BlocConsumer(
            bloc: widget.filmesBloc,
            builder: (context, state) {
              if (state is FilmesSucess) {
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(thickness: 2, color: Colors.white,);
                  },
                    addAutomaticKeepAlives: true,
                    itemCount: state.listaFilmeEntity.filmes.length,
                    itemBuilder: (context, index) {
                      bool ehFavorito = Modular.get<FavoritosBloc>().favoritosRepository.listaFavoritosEntity.favoritos.any((element) {
                        if (element is FilmeEntity){
                          if (element.titulo == state.listaFilmeEntity.filmes[index].titulo){
                            return true;
                          }
                        }
                        return false;
                      });
                      return Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(12),

                          ),
                          title: Text(state.listaFilmeEntity.filmes[index].titulo),
                          trailing: IconButton(
                            icon: Icon(ehFavorito
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: ehFavorito ? null : () {

                              widget.favoritosBloc.add(FavoritosEventAdicionar(filmeOuPersonagem: state.listaFilmeEntity.filmes[index]));
                            },
                          ),
                        ),
                      );
                    });
              } else {
                return Builder(builder: (context) {
                  Modular.to.navigate('/');
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.red,
                  );
                });
              }
            },
            listener: (context, state) {
              if (state is FilmesSucess) {
                Modular.to.pop('/dashboardPage/');
              }
              if (state is FilmesError) {
                Modular.to.pop('/dashboardPage/');
                showDialog(
                  context: context,
                  builder: (_) => const ErroNoServidorPopUpWidget(
                    titulo: 'Erro no servidor.',
                    mensagem: 'Por favor, tente mais tarde.',
                    caminhoDeVolta: '/dashboardPage/',
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

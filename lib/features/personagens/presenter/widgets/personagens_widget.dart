import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/favoritos/presenter/bloc/favoritos_bloc.dart';
import '../../../../global/presenter/widgets/erro_no_servidor_popup_widget.dart';
import '../bloc/personagens_bloc.dart';

class PersonagensWidget extends StatefulWidget {
  PersonagensWidget({Key? key}) : super(key: key);
  final personagensBloc = Modular.get<PersonagensBloc>();
  final FavoritosBloc favoritosBloc = Modular.get<FavoritosBloc>();
  @override
  State<PersonagensWidget> createState() => _PersonagensWidgetState();
}

class _PersonagensWidgetState extends State<PersonagensWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.favoritosBloc,
      builder: (context, state) {
        return BlocConsumer(
          bloc: widget.personagensBloc,
          builder: (context, state) {
            if (state is PersonagensSucess) {
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 2,
                      color: Colors.white,
                    );
                  },
                  addAutomaticKeepAlives: true,
                  itemCount: state.listaPersonagemEntity.personagens.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.listaPersonagemEntity.personagens[index].nome),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(width: 1),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                            Modular.get<FavoritosBloc>().listaFavoritosEntity.favoritos.contains(state.listaPersonagemEntity.personagens[index])
                                ? Icons.favorite
                                : Icons.favorite_border),
                        onPressed: () {
                          widget.favoritosBloc.add(FavoritosEventAdicionar(filmeOuPersonagem: state.listaPersonagemEntity.personagens[index]));
                        },
                      ),
                    );
                  });
            } else {
              return Container();
            }
          },
          listener: (context, state) {
            if (state is PersonagensSucess) {
              Modular.to.pop('/dashboardPage/');
            }
            if (state is PersonagensLoading) {
              showDialog(
                context: context,
                builder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(child: CircularProgressIndicator()),
                  ],
                ),
              );
            }
            if (state is PersonagensError) {
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
    );
  }
}

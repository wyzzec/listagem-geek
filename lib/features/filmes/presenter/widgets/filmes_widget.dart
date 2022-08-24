import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/filmes/presenter/bloc/filmes_bloc.dart';

import '../../../../global/presenter/widgets/erro_no_servidor_popup_widget.dart';

class FilmesWidget extends StatefulWidget {
  FilmesWidget({Key? key}) : super(key: key);
  final FilmesBloc filmesBloc = Modular.get<FilmesBloc>();
  @override
  State<FilmesWidget> createState() => _FilmesWidgetState();
}

class _FilmesWidgetState extends State<FilmesWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: widget.filmesBloc,
      builder: (context, state) {
        if (state is FilmesSucess) {
          return ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: state.listaFilmeEntity.filmes.length,
              itemBuilder: (context, index) {
                return Text(state.listaFilmeEntity.filmes[index].titulo);
              });
        } else {
          return Container(width: 60, height: 60, color: Colors.red,);
        }
      },
      listener: (context, state) {
        if (state is FilmesSucess){
          Modular.to.pop('/dashboardPage/');
        }
        if (state is FilmesLoading) {
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
  }
}

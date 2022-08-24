import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/filmes/presenter/bloc/filmes_bloc.dart';
import 'package:listagem_geek/features/personagens/presenter/bloc/personagens_bloc.dart';
import '../../../personagens/presenter/bloc/personagens_bloc.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);
  final filmesBloc = Modular.get<FilmesBloc>();
  final personagensBloc = Modular.get<PersonagensBloc>();
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.filmesBloc.add(PreencherListaFilmesEvent());
    widget.personagensBloc.add(PreencherPersonagensEvent());
    waitLoading();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Text(
              'Carregando dados...',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void waitLoading() async {
    bool loading = true;
    do {
      await Future.delayed(const Duration(seconds: 1)).then((_) {
        if (widget.personagensBloc.state is PersonagensSucess && widget.filmesBloc.state is FilmesSucess) {
          loading = false;
        }
      });
    } while (loading);
    Modular.to.navigate(
      '/dashboardPage/',
    );
  }
}

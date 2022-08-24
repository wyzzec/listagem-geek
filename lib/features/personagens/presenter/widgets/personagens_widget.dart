import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../global/presenter/widgets/erro_no_servidor_popup_widget.dart';
import '../bloc/personagens_bloc.dart';

class PersonagensWidget extends StatefulWidget {
  PersonagensWidget({Key? key}) : super(key: key);
  final personagensBloc = Modular.get<PersonagensBloc>();
  @override
  State<PersonagensWidget> createState() => _PersonagensWidgetState();
}

class _PersonagensWidgetState extends State<PersonagensWidget> {
  @override
  void initState() {
    widget.personagensBloc.add(PreencherPersonagensEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: widget.personagensBloc,
      builder: (context, state) {
        if (state is PersonagensSucess) {
          return ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: state.listaPersonagemEntity.personagens.length,
              itemBuilder: (context, index) {
                return Text(state.listaPersonagemEntity.personagens[index].nome);
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
  }
}

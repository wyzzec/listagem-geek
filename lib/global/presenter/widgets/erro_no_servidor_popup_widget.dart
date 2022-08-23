import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ErroNoServidorPopUpWidget extends StatelessWidget {
  const ErroNoServidorPopUpWidget({Key? key, required this.titulo, required this.mensagem, required this.caminhoDeVolta}) : super(key: key);
  final String titulo;
  final String mensagem;
  final String caminhoDeVolta;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text(titulo),
      content: Text(
        mensagem,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Modular.to.pop(caminhoDeVolta);
            },
            child: const Text('Ok'))
      ],
    );
  }
}

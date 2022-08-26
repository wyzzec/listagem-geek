import 'package:flutter/material.dart';
import 'package:listagem_geek/features/favoritos/presenter/widgets/favoritos_widget.dart';
import 'package:listagem_geek/features/filmes/presenter/widgets/filmes_widget.dart';
import 'package:listagem_geek/features/personagens/presenter/widgets/personagens_widget.dart';

class ToggleButtonListasWidget extends StatefulWidget {
  ToggleButtonListasWidget({Key? key}) : super(key: key);
  final List<Widget> listaWidgets = [FilmesWidget(), PersonagensWidget(), FavoritosWidget()];
  @override
  State<ToggleButtonListasWidget> createState() => _ToggleButtonListasWidgetState();
}

class _ToggleButtonListasWidgetState extends State<ToggleButtonListasWidget> {
  int indexLista = 0;
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
          onPressed: (int index) {
            setState(() {
              indexLista = index;
              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            });
          },
          isSelected: isSelected,
          children:  <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(children: const [Icon(Icons.movie), SizedBox(width: 3,),Text('Filmes'), ],),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(children: const [Icon(Icons.person), SizedBox(width: 3,),Text('Personagens'), ],),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(children: const [Icon(Icons.favorite), SizedBox(width: 3,),Text('Favoritos'), ],),
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Flexible(
          child: SizedBox(
              width: double.infinity,
              height: 450,
              child: widget.listaWidgets[indexLista]),
        ),
      ],
    );
  }
}

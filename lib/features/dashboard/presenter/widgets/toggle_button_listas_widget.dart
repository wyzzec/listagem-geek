import 'package:flutter/material.dart';
import 'package:listagem_geek/features/filmes/presenter/widgets/filmes_widget.dart';
import 'package:listagem_geek/features/personagens/presenter/widgets/personagens_widget.dart';

class ToggleButtonListasWidget extends StatefulWidget {
  ToggleButtonListasWidget({Key? key}) : super(key: key);
  List<Widget> listaWidgets = [FilmesWidget(), PersonagensWidget(), PersonagensWidget()];
  int indexLista = 0;
  @override
  State<ToggleButtonListasWidget> createState() => _ToggleButtonListasWidgetState();
}

class _ToggleButtonListasWidgetState extends State<ToggleButtonListasWidget> {
  final List<bool> isSelected = List.generate(3, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleButtons(
          onPressed: (int index) {
            setState(() {
              widget.indexLista = index;
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
              child: Container(child: Row(children: [Icon(Icons.movie), SizedBox(width: 3,),Text('Filmes'), ],),),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(child: Row(children: [Icon(Icons.person), SizedBox(width: 3,),Text('Personagens'), ],),),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(child: Row(children: [Icon(Icons.favorite), SizedBox(width: 3,),Text('Favoritos'), ],),),
            ),
          ],
        ),
        Container(
            width: 500,
            height: 500,
            child: widget.listaWidgets[widget.indexLista]),
      ],
    );
  }
}

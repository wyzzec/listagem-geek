import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/dashboard/presenter/widgets/toggle_button_listas_widget.dart';
import 'package:listagem_geek/features/favoritos/infra/repositories/favoritos_repository.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Listagem GEEK'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {
              Modular.get<FavoritosRepository>().deletarDatabase();
            }, child: Text('deletar database')),
            ToggleButtonListasWidget(),
          ],
        ),
      ),
    ));
  }
}

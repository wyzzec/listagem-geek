import 'package:flutter/material.dart';
import 'package:listagem_geek/features/dashboard/presenter/widgets/toggle_button_listas_widget.dart';

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
            ToggleButtonListasWidget(),
          ],
        ),
      ),
    ));
  }
}

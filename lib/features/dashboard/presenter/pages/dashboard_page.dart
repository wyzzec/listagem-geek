import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:listagem_geek/features/dashboard/presenter/widgets/toggle_button_listas_widget.dart';
import 'package:listagem_geek/features/fluttermoji/infra/repositories/fluttermoji_repository.dart';
import 'package:listagem_geek/features/fluttermoji/presenter/widgets/fluttermoji_customizer_widget.dart';
import '../widgets/site_oficial_widget.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List<bool> siteOficial = [
    false,
  ];
  List<bool> avatar = [
    false,
  ];
  FluttermojiFunctions fluttermojiFunctions = FluttermojiFunctions();

  @override
  void initState() {
    super.initState();
    loadFluttermoji();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                ToggleButtons(
                  onPressed: (int index) {
                    setState(() {
                      if (avatar[0] == true) {
                        avatar[0] = !avatar[0];
                        siteOficial[0] = !siteOficial[0];
                      } else {
                        siteOficial[0] = !siteOficial[0];
                      }
                    });
                  },
                  isSelected: siteOficial,
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Site Oficial'),
                    ),
                  ],
                ),
                const Spacer(),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(60),
                  onPressed: (int index) {
                    setState(() {
                      if (siteOficial[0] == true) {
                        siteOficial[0] = !siteOficial[0];
                        avatar[0] = !avatar[0];
                        loadFluttermoji();
                      } else {
                        avatar[0] = !avatar[0];
                        loadFluttermoji();
                      }
                    });
                  },
                  isSelected: avatar,
                  children: <Widget>[
                    FluttermojiCircleAvatar(
                      radius: avatar[0] == true ? 100 : 30,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            if (siteOficial[0] == false && avatar[0] == false) ToggleButtonListasWidget(),
            if (siteOficial[0] == true && avatar[0] == false)
              const Expanded(
                child: SizedBox(width: 500, height: 500, child: SiteOficialWidget()),
              ),
            if (siteOficial[0] == false && avatar[0] == true) const FluttermojiCustomizerWidget(),
          ],
        ),
      ),
    ));
  }
 loadFluttermoji() {
   fluttermojiFunctions.decodeFluttermojifromString(Modular.get<FluttermojiRepository>().fluttermojiData);
 }
}
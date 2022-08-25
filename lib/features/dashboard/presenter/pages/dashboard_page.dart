import 'package:flutter/material.dart';
import 'package:listagem_geek/features/dashboard/presenter/widgets/toggle_button_listas_widget.dart';

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
                    Text('Site Oficial'),
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
                      } else {
                        avatar[0] = !avatar[0];
                      }
                    });
                  },
                  isSelected: avatar,
                  children: const <Widget>[
                    Icon(Icons.person_outline_rounded),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            // TextButton(
            //     onPressed: () {
            //       Modular.get<FavoritosRepository>().deletarDatabase();
            //     },
            //     child: const Text('deletar database')),
            const SizedBox(
              height: 10,
            ),
            if (siteOficial[0] == false && avatar[0] == false) ToggleButtonListasWidget(),
            if (siteOficial[0] == true && avatar[0] == false) const Expanded(
              child: SizedBox(
                  width: 500,
                  height: 500,
                  child: SiteOficialWidget()),
            ),
          ],
        ),
      ),
    ));
  }
}

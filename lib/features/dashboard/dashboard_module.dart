import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/dashboard/presenter/pages/dashboard_page.dart';
import 'package:listagem_geek/features/filmes/filmes_module.dart';

class DashboardModule extends Module {
  @override
  List<Module> get imports => [
    FilmesModule(),
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const DashBoardPage())
  ];
}
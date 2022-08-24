import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/dashboard/dashboard_module.dart';
import 'package:listagem_geek/features/dashboard/presenter/pages/splash_page.dart';
import 'package:listagem_geek/features/filmes/filmes_module.dart';
import 'package:listagem_geek/features/personagens/personagens_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [FilmesModule(), PersonagensModule()];
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashPage(),
    transition: TransitionType.rightToLeftWithFade,
    ),
    ModuleRoute('/dashboardPage/', module: DashboardModule(),
    transition: TransitionType.rightToLeftWithFade,
    ),
  ];
}
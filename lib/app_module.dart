import 'package:flutter_modular/flutter_modular.dart';
import 'package:listagem_geek/features/dashboard/dashboard_module.dart';
import 'package:listagem_geek/features/dashboard/presenter/pages/splash_page.dart';
import 'package:listagem_geek/features/favoritos/infra/repositories/favoritos_repository.dart';
import 'package:listagem_geek/features/favoritos/presenter/bloc/favoritos_bloc.dart';
import 'package:listagem_geek/features/filmes/filmes_module.dart';
import 'package:listagem_geek/features/fluttermoji/infra/repositories/fluttermoji_repository.dart';
import 'package:listagem_geek/features/personagens/personagens_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [FilmesModule(), PersonagensModule()];

  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => FavoritosBloc()),
    Bind.singleton((i) => FavoritosRepository()),
    Bind.singleton((i) => FluttermojiRepository())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashPage(),
    transition: TransitionType.rightToLeftWithFade,
    ),
    ModuleRoute('/dashboardPage/', module: DashboardModule(),
    transition: TransitionType.rightToLeftWithFade,
    ),
  ];
}
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_teste/app/modules/home/domain/usecases/get_noticias_usecases.dart';
import 'package:fteam_teste/app/modules/home/external/datasource/noticias_datasource_impl.dart';
import 'package:fteam_teste/app/modules/home/infra/repository/noticia_repository_impl.dart';
import 'package:fteam_teste/app/modules/home/presenter/pages/home_bloc.dart';
import 'package:fteam_teste/app/modules/home/presenter/pages/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.factory((i) => Dio()),
    Bind.factory((i) => NoticiasDatasourceImpl(i<Dio>())),
    Bind.factory((i) => NoticiaRepositoryImpl(i<NoticiasDatasourceImpl>())),
    Bind.factory((i) => GetNoticiasImpl(i<NoticiaRepositoryImpl>())),
    Bind.singleton((i) => HomeBloc(i<GetNoticiasImpl>()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => HomePage()),
  ];
}
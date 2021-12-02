import 'package:dartz/dartz.dart';
import 'package:fteam_teste/app/modules/home/domain/dto/page_dto.dart';
import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';
import 'package:fteam_teste/app/modules/home/domain/error/error_noticia.dart';
import 'package:fteam_teste/app/modules/home/domain/repository/noticia_repository.dart';
import 'package:fteam_teste/app/modules/home/infra/datasource/noticias_datasource.dart';

class NoticiaRepositoryImpl implements NoticiaRepository {

  NoticiasDatasource noticiasDatasource;

  NoticiaRepositoryImpl(this.noticiasDatasource);

  @override
  Future<Either< ErrorNoticiaException,List<Noticia>>> getNoticias(PageDto pageDto) async {
    try {
      var noticias = await noticiasDatasource.getNoticias(pageDto);
      return Right(noticias);
    } on ErrorNoticiaException catch (e,s) {
      throw Left(e);
    }
  }
  
}
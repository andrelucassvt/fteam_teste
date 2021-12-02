import 'package:dartz/dartz.dart';
import 'package:fteam_teste/app/modules/home/domain/dto/page_dto.dart';
import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';
import 'package:fteam_teste/app/modules/home/domain/error/error_noticia.dart';

abstract class NoticiaRepository {
  Future<Either< ErrorNoticiaException,List<Noticia>>> getNoticias(PageDto pageDto);
}
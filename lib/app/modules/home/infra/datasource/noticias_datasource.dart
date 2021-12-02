import 'package:fteam_teste/app/modules/home/domain/dto/page_dto.dart';
import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';

abstract class NoticiasDatasource {
  Future<List<Noticia>> getNoticias(PageDto pageDto){}
}
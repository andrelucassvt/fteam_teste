import 'package:dio/dio.dart';
import 'package:fteam_teste/app/modules/home/domain/dto/page_dto.dart';
import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';
import 'package:fteam_teste/app/modules/home/domain/error/error_noticia_not_found.dart';
import 'package:fteam_teste/app/modules/home/infra/datasource/noticias_datasource.dart';
import 'package:fteam_teste/app/modules/home/infra/model/noticia_model.dart';

class NoticiasDatasourceImpl implements NoticiasDatasource {

  final Dio dio;
  NoticiasDatasourceImpl(this.dio);
  
  @override
  Future<List<Noticia>> getNoticias(PageDto pageDto) async {
    try {      
      Response response = await dio.get('https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=${pageDto.page}&per_page=10');
      return NoticiaModel.fromJsonList(response.data);
    }on DioError catch (e,s) {
      throw ApiErrorNoticia(e.message,s);
    }
  }
  
}
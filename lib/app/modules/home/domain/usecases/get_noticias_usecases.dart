import 'package:dartz/dartz.dart';
import 'package:fteam_teste/app/modules/home/domain/dto/page_dto.dart';
import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';
import 'package:fteam_teste/app/modules/home/domain/error/error_domain.dart';
import 'package:fteam_teste/app/modules/home/domain/error/error_noticia.dart';
import 'package:fteam_teste/app/modules/home/domain/repository/noticia_repository.dart';

abstract class GetNoticias {
  Future<Either<ErrorNoticiaException,List<Noticia>>> call(PageDto pageDto);
}

class GetNoticiasImpl implements GetNoticias {

  final NoticiaRepository repository;
  GetNoticiasImpl(this.repository);

  @override
  Future<Either< ErrorNoticiaException,List<Noticia>>> call(PageDto pageDto) async {
    if(pageDto.page == null){
      return left(ErrorDomain('Paremetro errado', StackTrace.current));
    }
    return await repository.getNoticias(pageDto);
  }
  
}
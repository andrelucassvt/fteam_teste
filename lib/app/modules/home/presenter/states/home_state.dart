import 'package:fteam_teste/app/modules/home/domain/dto/page_dto.dart';
import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';

abstract class HomeState {}

class HomeStateSucess implements HomeState {
  final List<Noticia> data;
  final PageDto pageDto;
  HomeStateSucess(this.data,this.pageDto);

  HomeStateSucess copyWith(List<Noticia> list, PageDto pageDto){
    return HomeStateSucess(list,pageDto);
  }

  factory HomeStateSucess.empty() => HomeStateSucess([],PageDto(page: 1));
}

class HomeStateLoading implements HomeState {}

class HomeStateError implements HomeState {
  final String message;
  HomeStateError(this.message);
}
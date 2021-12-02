import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';


class NoticiaModel extends Noticia {
  int id;
  String title;

  NoticiaModel({this.id,this.title});

  factory NoticiaModel.fromMap(Map<String, dynamic> map) {
    return NoticiaModel(
      id: map['id'],
      title: map['title']['rendered'],
    );
  }

  static List<NoticiaModel> fromJsonList(List list){
    if(list == null){
      return [];
    }
    return list.map((e) => NoticiaModel.fromMap(e)).toList();
  }
}

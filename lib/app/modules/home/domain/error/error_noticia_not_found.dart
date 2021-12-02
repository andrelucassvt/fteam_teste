import 'package:fteam_teste/app/modules/home/domain/error/error_noticia.dart';

class ApiErrorNoticia extends ErrorNoticiaException {
  ApiErrorNoticia(String message,StackTrace stackTrace) : super(message,stackTrace);
}
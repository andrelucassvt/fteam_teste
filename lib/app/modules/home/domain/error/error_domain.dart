import 'package:fteam_teste/app/modules/home/domain/error/error_noticia.dart';

class ErrorDomain extends ErrorNoticiaException{
  ErrorDomain(String message, StackTrace stackTrace) : super(message, stackTrace);
}
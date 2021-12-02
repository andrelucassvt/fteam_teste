import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fteam_teste/app/modules/home/domain/dto/page_dto.dart';
import 'package:fteam_teste/app/modules/home/domain/usecases/get_noticias_usecases.dart';
import 'package:fteam_teste/app/modules/home/presenter/states/home_events.dart';
import 'package:fteam_teste/app/modules/home/presenter/states/home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  final GetNoticias service;
  HomeBloc(this.service) : super(HomeStateSucess.empty());

  ScrollController scrollController = ScrollController();
  bool updated = false;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    final params = state as HomeStateSucess;
    yield HomeStateLoading();
    var dados = await service(params.pageDto);
    yield dados.fold(
      (failure) => HomeStateError(failure.message),
      (success) {
        updated = false;
       return HomeStateSucess([...params.data,...success],PageDto(page: params.pageDto.page += 1));
      }
    );
  }

  listenScroll(){
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent - 50 <= scrollController.offset && !updated){
        updated = true;
        add(FetchNoticia());
      }
    });
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_teste/app/modules/home/presenter/pages/home_bloc.dart';
import 'package:fteam_teste/app/modules/home/presenter/states/home_events.dart';
import 'package:fteam_teste/app/modules/home/presenter/states/home_state.dart';
import 'package:fteam_teste/app/modules/home/presenter/widgets/card_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage,HomeBloc> {
  var sucess = HomeStateSucess.empty();
  @override
  void initState() {
    super.initState();
    controller.add(FetchNoticia());
    controller.listenScroll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
      ),

      body: BlocBuilder<HomeBloc,HomeState>(
        bloc: controller,
        builder: (context, state) {

          if(state is HomeStateError){
            return const Center(
              child: Text('Ocorreu um erro ao carregar noticias',style: TextStyle(color: Colors.red)),
            );
          }
          if(state is HomeStateSucess){
            sucess = state;
          }

          return Column(
            children: [
              if(sucess.data.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: sucess.data.length,
                    controller: controller.scrollController,
                    itemBuilder: (context,index){
                      return CardWidget(sucess.data[index]);
                    }
                  ),
                ),

              if(state is HomeStateLoading)
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  child: Center(child: CircularProgressIndicator())
                )
            ],
          );
        }
      ),
    );
  }
}
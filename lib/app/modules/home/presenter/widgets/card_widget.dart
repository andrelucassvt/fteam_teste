import 'package:flutter/material.dart';
import 'package:fteam_teste/app/modules/home/domain/entidades/noticia_entity.dart';

class CardWidget extends StatelessWidget {
  final Noticia model;
  CardWidget(this.model);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(
          top: 120,
          right: 10,
          left: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Text(
            model.title,
            style: TextStyle(
              fontSize: 20
              )
            ),
        ),
      ),
    );
  }
}
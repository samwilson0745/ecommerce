import 'package:flutter/material.dart';
class TimeLineModel{
  String? id;
  String? title;
  String? description;
  Color? iconBackground;
  Widget? icon;
  TimeLineModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconBackground,
    required this.icon
});
}
import 'package:flutter/material.dart';

class BoxContainerModel {
  final String boxContainerId;
  final Color boxContainerColor;
  final IconData? deleteContainerBox;

  BoxContainerModel({
    required this.boxContainerId,
    required this.boxContainerColor,
    this.deleteContainerBox = Icons.delete,
  });
}

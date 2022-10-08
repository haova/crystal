import 'package:flutter/material.dart';

abstract class Setting {
  Map<String, dynamic> json = {};

  Widget build(Function onNavigation);
}

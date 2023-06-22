import 'package:flutter/material.dart';

class SizeService {
  static late BuildContext context;

  static void init(BuildContext serviceContext) {
    context = serviceContext;
  }

  static final width = MediaQuery.of(context).size.width;
  static final height = MediaQuery.of(context).size.height;
}

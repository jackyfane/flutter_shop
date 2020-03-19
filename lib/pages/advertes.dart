import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Advertisement extends StatelessWidget {
  Advertisement({this.advertUrl});

  String advertUrl;

  @override
  Widget build(BuildContext context) {
    return advertUrl != '' ? Image.network(advertUrl) : Container();
  }
}

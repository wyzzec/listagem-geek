import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';

class FluttermojiCustomizerWidget extends StatefulWidget {
  const FluttermojiCustomizerWidget({Key? key}) : super(key: key);

  @override
  State<FluttermojiCustomizerWidget> createState() => _FluttermojiCustomizerState();
}

class _FluttermojiCustomizerState extends State<FluttermojiCustomizerWidget> {
  FluttermojiController fluttermojiController = FluttermojiController();
  FluttermojiFunctions fluttermojiFunctions = FluttermojiFunctions();
  @override

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
      child: FluttermojiCustomizer(
        scaffoldWidth: min(600, width * 0.8),
        scaffoldHeight: min(600, width * 0.8),
        autosave: true,
        theme: FluttermojiThemeData(boxDecoration: const BoxDecoration(boxShadow: [BoxShadow()])),
      ),
    );
  }


}

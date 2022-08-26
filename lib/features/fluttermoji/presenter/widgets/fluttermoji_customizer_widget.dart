import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';

import '../../infra/repositories/fluttermoji_repository.dart';

class FluttermojiCustomizerWidget extends StatefulWidget {
  const FluttermojiCustomizerWidget({Key? key}) : super(key: key);

  @override
  State<FluttermojiCustomizerWidget> createState() => _FluttermojiCustomizerState();
}

class _FluttermojiCustomizerState extends State<FluttermojiCustomizerWidget> {
  FluttermojiController fluttermojiController = FluttermojiController();
  FluttermojiFunctions fluttermojiFunctions = FluttermojiFunctions();
  @override
  void dispose() {
    saveFluttermoji();
    super.dispose();
  }

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

  saveFluttermoji() async {
    Modular.get<FluttermojiRepository>().setFluttermojiData(await fluttermojiFunctions.encodeMySVGtoString());
  }
}

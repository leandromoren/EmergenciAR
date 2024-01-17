import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:vidar_app/utils/constants/styles.dart';

class Sugerencias extends StatefulWidget {
  final AnimationController animacion;
  final List<String> textos;
  final int indice;

  const Sugerencias(
      {super.key,
      required this.animacion,
      required this.textos,
      required this.indice});

  @override
  State<Sugerencias> createState() => _SugerenciasState();
}

class _SugerenciasState extends State<Sugerencias> {
  late Timer _timer;
  int _indice = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        _indice = (_indice + 1) % widget.textos.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (widget, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.6),
                end: Offset.zero,
              ).animate(animation),
              child: widget,
            ),
          );
        },
        child: AnimatedTextKit(
          key: ValueKey<int>(_indice),
          animatedTexts: [
            ColorizeAnimatedText(
              '🛡️ ${widget.textos[_indice]}',
              textStyle: textoSugerencias,
              textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 50),
              colors: colorizeColors,
            ),
          ],
        ),
      ),
    );
  }
}
